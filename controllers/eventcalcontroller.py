from tg import expose, flash, require, url, request, redirect,validate
from yourproject.lib.base import BaseController
from yourproject.model import TheEvent, Doc, DBSession, metadata
from yourproject import model
from yourproject.controllers.secure import SecureController
from pylons import tmpl_context as c
import transaction
from tw2.jqplugins.jqgrid.widgets.core import jqGridWidget
import re, datetime, calendar
from datetime import datetime
import os
import shutil
from pkg_resources import resource_filename
import simplejson as json
from webob import Request  
   
__all__ = ['eventcalcontroller']

class eventcalcontoller(BaseController):   
   
    @expose('yourproject.templates.eventcal')
    def cal(self, *args, **kw):
        calendar.setfirstweekday(6)
        year = ['January', 
                    'February', 
                    'March', 
                    'April', 
                    'May', 
                    'June', 
                    'July', 
                    'August', 
                    'September', 
                    'October', 
                    'November', 
                    'December'] 
        
        today = datetime.date(datetime.now())  
        current = re.split('-', str(today)) 
        current_no = int(current[1]) 
        current_month = year[current_no-1] 
        current_day = int(re.sub('\A0', '', current[2])) 
        current_yr = int(current[0]) 
        month = calendar.monthcalendar(current_yr, current_no) 
        nweeks=len(month)
        weeklist=[]
        for w in range(0,nweeks): 
			weeklist.append(month[w])
        #event = DBSession.query(Event).filter_by(month=int(current_month)).all()
        if kw:

            if int(kw['month'])>current_no:
                current_no=int(kw['month'])
                current_yr=int(kw['year'])
                current_day=50
                month= calendar.monthcalendar(current_yr, current_no) 
                nweeks=len(month)
                current_month = year[current_no-1] 
                weeklist=[]
                for w in range(0,nweeks): 
                    weeklist.append(month[w])
            else:
                if int(kw['year'])>current_yr:
		    current_no=int(kw['month'])
		    current_yr=int(kw['year'])
		    current_day=50
		    month= calendar.monthcalendar(current_yr, current_no) 
		    nweeks=len(month)
		    current_month = year[current_no-1] 
		    weeklist=[]
		    for w in range(0,nweeks): 
		       weeklist.append(month[w])
		        
        even = DBSession.query(TheEvent).filter_by(month=int(current_no)).all()
        events=[]
        rawevents=[]
        doneday=[]
        dontdouble=False
        for row in even:
            if row:
                if row.doc:
                    doclink=row.doc.name
                    doclinkdesc=row.doc.description
                    public_dirname = os.path.join(os.path.abspath(resource_filename('ostacct', 'public')))
                    doc_dirname = os.path.join(public_dirname, 'eventdoc')
                else: doclink=None
                #doclink = os.path.join(doc_dirname, str(row.docs))
                rawevents.append([row.month,row.day,row.year,row.typ,row.Description,doclink]) 
            else:
                doc="something"
                doclink=""
                doclinkdesc=""
                rawevents.append([row.month,row.day,row.year,row.typ,row.Description,doclink])
        doneit=False
        dontdouble=[] 
        for m, d, y,typ,Desc,doc in rawevents:
            Thisday=d
            devent=[]           
            for m, d, y,typ,Desc,doc in rawevents:                 
                if d==Thisday:
                    devent.append((typ,Desc,doc))
                    devent.append(("-----------------------","",""))
            for row in dontdouble:
                if row==Thisday:
                    doneit=True
            dontdouble.append(Thisday)
            if doneit==False:                
                events.append((m,Thisday,y,devent))
                #events.append(("--","--","----","-----"))
            doneit=False         
        #events.append([row.month.day,row.year,row.typ,row.Description,doclink])  
        return dict(page='Calendar', year=year, today=today, current=current, current_no=current_no, 
                    current_month=current_month, current_day=current_day, current_yr=current_yr, 
                     month = month,  nweeks = nweeks , weeklist=weeklist,events=events)
