from pyecharts import Bar, Timeline, Page
import numpy as np

from pyecharts import configure
import sklearn
# 将这行代码置于首部
#configure(global_theme='shine')

page=Page()
attr = ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"]
bar_1 = Bar("2012 年销量", "数据纯属虚构")
bar_1.add("春季", attr, [np.random.randint(10, 100) for _ in range(6)])
bar_1.add("夏季", attr, [np.random.randint(10, 100) for _ in range(6)])
bar_1.add("秋季", attr, [np.random.randint(10, 100) for _ in range(6)])
bar_1.add("冬季", attr, [np.random.randint(10, 100) for _ in range(6)])

bar_2 = Bar("2013 年销量", "数据纯属虚构")
bar_2.add("春季", attr, [np.random.randint(10, 100) for _ in range(6)])
bar_2.add("夏季", attr, [np.random.randint(10, 100) for _ in range(6)])
bar_2.add("秋季", attr, [np.random.randint(10, 100) for _ in range(6)])
bar_2.add("冬季", attr, [np.random.randint(10, 100) for _ in range(6)])

bar_3 = Bar("2014 年销量", "数据纯属虚构")
bar_3.add("春季", attr, [np.random.randint(10, 100) for _ in range(6)])
bar_3.add("夏季", attr, [np.random.randint(10, 100) for _ in range(6)])
bar_3.add("秋季", attr, [np.random.randint(10, 100) for _ in range(6)])
bar_3.add("冬季", attr, [np.random.randint(10, 100) for _ in range(6)])

bar_4 = Bar("2015 年销量", "数据纯属虚构")
bar_4.add("春季", attr, [np.random.randint(10, 100) for _ in range(6)])
bar_4.add("夏季", attr, [np.random.randint(10, 100) for _ in range(6)])
bar_4.add("秋季", attr, [np.random.randint(10, 100) for _ in range(6)])
bar_4.add("冬季", attr, [np.random.randint(10, 100) for _ in range(6)])

bar_5 = Bar("2016 年销量", "数据纯属虚构")
bar_5.add("春季", attr, [np.random.randint(10, 100) for _ in range(6)])
bar_5.add("夏季", attr, [np.random.randint(10, 100) for _ in range(6)])
bar_5.add("秋季", attr, [np.random.randint(10, 100) for _ in range(6)])
bar_5.add("冬季", attr, [np.random.randint(10, 300) for _ in range(6)], is_legend_show=True)
bar_1.use_theme("Mywalden")
bar_5.use_theme("dark")

timeline = Timeline(is_auto_play=True, timeline_bottom=0)
page.add(bar_1)
page.add(bar_2)
page.add(bar_3)
page.add(bar_4)
page.add(bar_5)
page.render()