import numpy as np
from pyecharts import Page,Line,Bar,Overlap
#dt_AK = np.dtype(('S10,f8', 10))  

#dt = np.dtype([('name', np.str, 16), ('grades', np.float64, (2,2))]) 

dt=np.dtype([('name','S6')])

attr=np.empty((20),dtype=dt)
attrA=np.empty((40),dtype=dt)
attrK=np.empty((40),dtype=dt)

def custom_formatter(params):

    b= params.value[2]+10.0
    return b
for i in range(0,20):
    attr[i]=str(i)+"m/s"
for i in range(0,40):
    attrA[i]="A="+str(round((i*0.05+5),2))
    attrK[i]="K="+str((round((i*0.05+1.5),2)))

v1 = np.random.rand(40)
print(v1)
Line_name1 ="weibull_distribution_accumulation"
Line_name1 = Line("when change A")
Line_name1.add("weibull_distribution when A=",attrA, v1,is_xaxislabel_align=True,is_xaxis_boundarygap=False,line_curve =0.2,tooltip_formatter=custom_formatter)

page = Page()  
page.add(Line_name1)
page.render()  

v3=np.empty(2)
print(v3)
print(attr)