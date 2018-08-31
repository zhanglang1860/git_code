import time,sys,math
from sympy import *
from pyecharts import Page,Line,Bar,Overlap
import numpy as np
from pyecharts import Timeline
from scipy.special import gamma

def weibull_distribution(v,c,k):
    #P(V0)  is the cumulative probability function, i.e. the probability that V<Vo; 
    # v is the wind speed (limit);
    # c is the scale parameter of the Weibull function; 
    # k is the shape parameter of the Weibull function; 
    # Γ  is the gamma function. 
    p=1-math.exp(-(v/c)**k)
    return p
def weibull_distributionAK(v,c,k):
    #    x = Symbol("x")
    #    f = 1-exp(-(x/c)**k)
    #    pp= f.diff().evalf(subs={x:v})

    pp=k*(v/c)**k*exp(-(v/c)**k)/v
    return pp
def weibull_distribution_avg(c,k):
    # v is the wind speed (limit);
    # c is the scale parameter of the Weibull function; 
    # k is the shape parameter of the Weibull function; 
    # Γ  is the gamma function. 
    avg=gamma(1+1/k)*c
    return avg
P = np.zeros([20,40,40])
PP = np.zeros([20,40,40])
avg=np.zeros([40,40])

c=5.0;k=1.5
stdc=20;stdk=10
for ci in range(0,40):
    k=1.5
    for ki in range(0,40):
        for vi in range(0,20):
            P[vi,ci,ki]=weibull_distribution(vi,c,k)
            PP[vi,ci,ki]=weibull_distributionAK(vi,c,k)
        avg[ci,ki]=weibull_distribution_avg(c,k)
        k=k+0.05
    c=c+0.05
P[0,:,:]=0;PP[0,:,:]=0
#P[vi,ci,ki] stand P[6,20,10] 


page = Page()  
#attr = ["{}m/s".format(i) for i in range(0,20)]
dt=np.dtype([('name','S5')])

attr=np.empty((20),dtype=dt)
attrA=np.empty((40),dtype=dt)
attrK=np.empty((40),dtype=dt)

for i in range(0,20):
    attr[i]=str(i)+"m/s"
for i in range(0,40):
    attrA[i]="A="+str(round((i*0.05+5),2))
    attrK[i]="K="+str((round((i*0.05+1.5),2)))


timeline_A = Timeline(is_auto_play=True, timeline_bottom=0,timeline_play_interval=100)
timeline_K = Timeline(is_auto_play=True, timeline_bottom=0,timeline_play_interval=100)
#only C change
c=5.0;k=1.5
v3=np.empty(40)
v4=np.empty(40)
stdc=20;stdk=10
for ci in range(0,40):
    for i in range(0,20):
        v1 = [P[i,ci,stdk] for i in range(0,20)]
        v2 = [PP[i,ci,stdk] for i in range(0,20)]
        v2=np.multiply(v2,100)
    v3[ci]=avg[ci,stdk] 
    c=round(c,2)
    Line_name1 ="weibull_distribution_accumulation"+str(c)
    Line_name1 = Line("when change A")
    Line_name1.add("weibull_distribution when A="+str(c),attr, v1,is_xaxislabel_align=True,is_xaxis_boundarygap=False,line_curve =0.2)
  
    Line_name2 ="weibull_distribution_AK"+str(c)
    Line_name2 = Line("when change A")
    Line_name2.add(
        "weibull_distribution when A="+str(c),
        attr,
        v2,
        is_xaxislabel_align=True,
        is_xaxis_boundarygap=False,
        yaxis_formatter=" %",
        yaxis_max=30,
        yaxis_force_interval=6,
        line_color='#ff6347',
        is_smooth=True,
        line_curve =0.2
    )
  

    overlap = Overlap(width=1200, height=600)
    overlap.add(Line_name2)
    overlap.add(Line_name1, is_add_yaxis=True, yaxis_index=1)

    timeline_A.add(overlap, "weibull_distribution A="+str(c))
    c=c+0.05

#only K change
c=5.0;k=1.5
stdc=20;stdk=10
for ki in range(0,40):
    for i in range(0,20):
        v1 = [P[i,stdc,ki] for i in range(0,20)]
        v2 = [PP[i,stdc,ki] for i in range(0,20)]
        v2=np.multiply(v2,100)
    v4[ki]=avg[stdc,ki]
    k=round(k,2)
    Line_name3 ="weibull_distribution_accumulation"+str(k)
    Line_name3 = Line("when change K")
    Line_name3.add("weibull_distribution when K="+str(k),attr, v1,is_xaxislabel_align=True,is_xaxis_boundarygap=False,line_curve =0.2)
  
    Line_name4 ="weibull_distribution_AK"+str(k)
    Line_name4 = Line("when change K")
    Line_name4.add(
        "weibull_distribution when K="+str(k),
        attr,
        v2,
        is_xaxislabel_align=True,
        is_xaxis_boundarygap=False,
        yaxis_formatter=" %",
        yaxis_max=30,
        yaxis_force_interval=6,
        line_color='#ff6347',
        is_smooth=True,
        line_curve =0.2
    )
 
  
    overlap = Overlap(width=1200, height=600)
    overlap.add(Line_name4)
    overlap.add(Line_name3, is_add_yaxis=True, yaxis_index=1)

    timeline_K.add(overlap, "weibull_distribution K="+str(k))
    k=k+0.05

Line_name5 ="weibull_distribution_avg wind speed for K"
Line_name5 = Line("when change A")
Line_name5.add("weibull_distribution_avg wind speed when K=2",attrA, v3,is_xaxislabel_align=True,is_xaxis_boundarygap=False,is_smooth=True)

Line_name6 ="weibull_distribution_avg wind speed for A"
Line_name6 = Line("when change K")
Line_name6.add("weibull_distribution_avg wind speed when A=6",attrK, v4,is_xaxislabel_align=True,is_xaxis_boundarygap=False,is_smooth=True)

page.add(timeline_A)
page.add(timeline_K)
page.add(Line_name5)
page.add(Line_name6)
page.render()   


#color
#
#{Array} [
#    '#ff7f50', '#87cefa', '#da70d6', '#32cd32', '#6495ed',
#    '#ff69b4', '#ba55d3', '#cd5c5c', '#ffa500', '#40e0d0',
#    '#1e90ff', '#ff6347', '#7b68ee', '#00fa9a', '#ffd700',
#    '#6b8e23', '#ff00ff', '#3cb371', '#b8860b', '#30e0e0'
#]，默认颜色序列，循环使用 

#x = Symbol("x");c = Symbol("c");k = Symbol("k")
#f=Function('f')
#f = 1-exp(-(x/c)**k)
#ps= diff(f,x)
#d=ps.subs([c,6],[k,2])

#k*(x/c)**k*exp(-(x/c)**k)/x
