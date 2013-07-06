#!/usr/bin/python
import  commands 
def cpisapp():
    ''' cpis app check 
    CLI Example:
        
       salt '*' cpisapp.cpisapp
    '''
    sc={}
    sc['cpisapp'] = commands.getoutput('/usr/local/cpis/bin/cpisapp')
    return sc
def amr():
    ''' cpis amr check
    CLI Example:
   
       salt '*' cpisapp.amr
    '''
    sc={}
    sc['amr'] = commands.getoutput('ccamr list')
    return sc
