# coding=utf8
"""
Test cases for jinja2 template functions
"""

from __future__ import unicode_literals
from nose.tools import raises

from pyecharts.utils import get_resource_dir
from pyecharts import Bar, Map
from pyecharts.engine import BaseEnvironment, EchartsEnvironment
from pyecharts.conf import PyEchartsConfig
from pyecharts.utils import write_utf8_html_file
ECHARTS_ENV = EchartsEnvironment()


def create_demo_bar(chart_id_demo=None):
    attr = ["衬衫", "羊毛衫", "雪纺衫", "裤子", "高跟鞋", "袜子"]
    v1 = [5, 20, 36, 10, 75, 90]
    v2 = [10, 25, 8, 60, 20, 80]
    bar = Bar("柱状图数据堆叠示例")
    bar.add("商家A", attr, v1, is_stack=True)
    bar.add("商家C", attr, v2, is_stack=True)
    bar.use_theme("Mywalden")
    if chart_id_demo:
        bar._chart_id = chart_id_demo
    return bar


def test_echarts_js_dependencies():
    env = EchartsEnvironment(
        pyecharts_config=PyEchartsConfig()
       # pyecharts_config=PyEchartsConfig()
    )
    tpl = env.get_template('tpl_demo.html')
    bar = create_demo_bar()
    html = tpl.render(bar=bar)
    # flake8: noqa
    write_utf8_html_file('my_tpl_demo4.html', html)

test_echarts_js_dependencies()