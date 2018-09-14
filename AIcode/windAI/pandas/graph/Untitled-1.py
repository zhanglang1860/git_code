# encoding: utf-8
import time
import sys
from pyecharts import Bar

from pyecharts import Bar, Scatter3D
from pyecharts import Page


page = Page() 

attr=["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"]

bar = Bar("我的第一个图表", "这里是副标题")
bar.add("服装", ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"], [5, 20, 36, 10, 75, 90],is_more_utils=True)
bar.show_config()
page.add(bar) 

from pyecharts import Bar
bar1 =Bar("标记线和标记点示例")
bar1.add("商家A", attr, [15, 20, 36, 10, 75, 90], mark_point=["average"],is_stack=True)
bar1.add("商家B", attr, [25, 10, 36, 20, 15, 90], mark_line=["min", "max"],is_stack=True)
page.add(bar1) 

from pyecharts import Bar
bar2 =Bar("x 轴和 y 轴交换")
bar2.add("商家A", ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"], [15, 20, 36, 10, 75, 90])
bar2.add("商家B", ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"], [25, 10, 36, 20, 15, 90], is_convert=True)
page.add(bar2) 
page.render() 