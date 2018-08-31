from sklearn.datasets import load_iris
import numpy as np
data = load_iris()
irisdata=data['data']
irisname=data['target'] #0,1,2分类的花名
arrname=data['feature_names'] #属性名

train_irisdata=np.c_[irisdata,irisname]
train_irisdataname=np.append(arrname,'iris name (string)')
import pandas as pd
#直接读到pandas的数据框中
frame=pd.DataFrame(train_irisdata, columns=train_irisdataname)

frame['c1']=np.array(frame['iris name (string)']==0).astype(np.float32)
frame['c2']=np.array(frame['iris name (string)']==1).astype(np.float32)
frame['c3']=np.array(frame['iris name (string)']==2).astype(np.float32)

target=np.stack([frame['c1'].values,frame['c2'].values,frame['c3'].values]).T
shuju=np.stack([frame['sepal length (cm)'].values,frame['sepal width (cm)'].values,frame['petal length (cm)'].values,frame['petal width (cm)'].values]).T


import tensorflow as tf
def loadGraph(dir):
    f = tf.gfile.FastGFile(dir,'rb')
    graph_def = tf.GraphDef()
    graph_def.ParseFromString(f.read())
    persisted_graph =tf.import_graph_def(graph_def,name='')
    return persisted_graph

graph = loadGraph('graph/soft.ph')

with tf.Session(graph=graph) as sess:

    softmax_tensor = sess.graph.get_tensor_by_name('final_result:0')
    x = sess.graph.get_tensor_by_name('x_input:0')
    y_ = sess.graph.get_tensor_by_name('y_input:0')
    #name = sess.graph.get_tensor_by_name('zhangyicheng:0')
    Weights = sess.graph.get_tensor_by_name('pandas_weights:0')
    biases = sess.graph.get_tensor_by_name('pandas_bias:0')


    #W = tf.Variable(tf.zeros([784, 10]), name='Weights')
    #b = tf.Variable(tf.zeros([10]), name='biases')
    #tf.add_to_collection(tf.GraphKeys.VARIABLES, name)
    tf.add_to_collection(tf.GraphKeys.VARIABLES, Weights)
    tf.add_to_collection(tf.GraphKeys.VARIABLES, biases)
    #try:
    #    saver = tf.train.Saver(tf.global_variables())  # 'Saver' misnomer! Better: Persister!
    #except:
    #    pass

    saver = tf.train.Saver(tf.global_variables())

    print("load data")
    #print sess.run(name) 此时才有一个Tensor获取变量还要进行赋值
    module_file = tf.train.latest_checkpoint('E:/AIcode/my_test_model/')    
    saver.restore(sess, module_file)

    print(sess.run(Weights))

    #test

    index=np.random.permutation(len(target))
    shuju=shuju[index]
    target=target[index]
    correct_prediction = tf.equal(tf.argmax(softmax_tensor, 1), tf.argmax(y_, 1))
    accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))
    print(accuracy.eval({x: shuju, y_: target}))