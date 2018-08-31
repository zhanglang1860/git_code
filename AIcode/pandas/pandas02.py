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

#import  seaborn as sns
#import matplotlib # 注意这个也要import一次
#import matplotlib.pyplot as plt
#sns.pairplot(frame,hue='iris name (string)')
#plt.show()
#print(train_irisdata[:,0])
#print(frame['iris name (string)'].unique())
#独热编码
frame['c1']=np.array(frame['iris name (string)']==0).astype(np.float32)
frame['c2']=np.array(frame['iris name (string)']==1).astype(np.float32)
frame['c3']=np.array(frame['iris name (string)']==2).astype(np.float32)

target=np.stack([frame['c1'].values,frame['c2'].values,frame['c3'].values]).T
shuju=np.stack([frame['sepal length (cm)'].values,frame['sepal width (cm)'].values,frame['petal length (cm)'].values,frame['petal width (cm)'].values]).T
print(np.shape(shuju),np.shape(target))

# 神经网络 训练

import tensorflow as tf
x=tf.placeholder('float32',shape=[None,4],name='x_input')
y=tf.placeholder('float32',shape=[None,3],name='y_input')
weight=tf.Variable(tf.truncated_normal([4,3]),name='pandas_weights')
bias=tf.Variable(tf.truncated_normal([3]),name='pandas_bias')
combine_input = tf.add(tf.matmul(x, weight), bias, name='pandas_combine_input')


pred=tf.nn.softmax(combine_input,name='final_result')
#print(y.get_shape(),combine_input.get_shape())
loss=tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(labels=y,logits=combine_input))
correct_pred=tf.equal(tf.argmax(pred,1),tf.argmax(y,1))
accuracy=tf.reduce_mean(tf.cast(correct_pred,tf.float32))

train_step=tf.train.AdamOptimizer(0.0005).minimize(loss)
sess=tf.Session()
sess.run(tf.global_variables_initializer())

num=0
loss_arry=np.zeros(50)
accuracy_arry=np.zeros(50)
for i in range(50000):

    index=np.random.permutation(len(target))
    shuju=shuju[index]
    target=target[index]
    sess.run(train_step,feed_dict={x: shuju, y: target})
    if i%1000==0:
        print(sess.run((loss,accuracy),feed_dict={x:shuju,y:target}))
        print(sess.run(weight))

        loss_arry[num]=sess.run((loss),feed_dict={x:shuju,y:target})
        accuracy_arry[num]=sess.run((accuracy),feed_dict={x:shuju,y:target})
        num=num+1

saver = tf.train.Saver()
saver.save(sess, './my_test_model/soft.ckpt',global_step=49000)
tf.train.write_graph(sess.graph_def,'graph','soft.ph',False)

import matplotlib.pyplot as plt

plt.plot(accuracy_arry)
plt.show()