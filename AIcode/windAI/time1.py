from pyecharts import Page,Line,Bar
import numpy as np
from pyecharts import Timeline
import pyecharts.echarts.events as events
from pyecharts import Bar
from pyecharts_javascripthon.dom import alert
from pyecharts_javascripthon import dom

def on_click(params):
    
    a="a阿斯顿"+params.name
    b=a[0:2]
    alert(b + ' [Good!]')
    

def custom_formatter(params):
    c=int(float(params.value)*100)/100
    d=c/100
    a="a阿斯顿"+params.name
    b=a[0:4]
    return c


page = Page()   

attr = ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"]
v1 = [5, 20, 36, 10, 10, 100]
v2 = [55, 60, 16, 20, 15, 80]
line = Line("折线图示例")
line.add("商家A", attr, v1, mark_point=["average"])
line.add("商家B", attr, v2, is_smooth=True, mark_line=["max", "average"])
page.add(line)

attr = ["{}m/s".format(i) for i in range(1,20)]
bar_5 = Bar("2016 年销量", "数据纯属虚构")
bar_5.add("春季", attr, [0.27679162,0.98743138,0.1447175,0.40970951,0.33220813,
0.43562702,0.28929405,0.91256093,0.74817828,0.26381043,0.19566134,0.93723141,
0.49840945,0.28306194,0.24027985,0.28172477,0.59784737,0.44663549,0.16470068],tooltip_formatter=custom_formatter)
bar_5.on(events.MOUSE_CLICK, on_click)


#timeline = Timeline(is_auto_play=True, timeline_bottom=0)
#timeline.add(line, '2012 年')
#timeline.add(bar_5, '2016 年')
#page.add(timeline)
page.add(bar_5)
page.render()