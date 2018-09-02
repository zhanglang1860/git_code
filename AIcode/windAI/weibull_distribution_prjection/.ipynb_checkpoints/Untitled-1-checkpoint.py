from echarts import Echart, Legend, Bar, Axis

chart = Echart('GDP', 'This is a fake chart')
chart.use(Bar('China', [2, 3, 4, 5]))
chart.use(Legend(['GDP']))
chart.use(Axis('category', 'bottom', data=['Nov', 'Dec', 'Jan', 'Feb']))

{
    "title": {
        "text": "GDP",
        "subtext": "This is a fake chart"
    },
    "series": [
        {
            "type": "bar",
            "data": [
                2,
                3,
                4,
                5
            ],
            "name": "China"
        }
    ],
    "legend": {
        "y": "top",
        "x": "center",
        "data": [
            "GDP"
        ],
        "orient": "horizontal"
    },
    "xAxis": [
        {
            "position": "bottom",
            "data": [
                "Nov",
                "Dec",
                "Jan",
                "Feb"
            ],
            "type": "category"
        }
    ],
    "yAxis": {}
}