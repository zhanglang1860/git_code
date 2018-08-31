from pyecharts import Page,Line,Bar
import numpy as np
from pyecharts import Timeline

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
bar_5.add("春季", attr, [np.random.randint(10, 100) for _ in range(19)])

timeline = Timeline(is_auto_play=True, timeline_bottom=0)
timeline.add(line, '2012 年')
timeline.add(bar_5, '2016 年')
page.add(timeline)
page.render()