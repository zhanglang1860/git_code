import tensorflow as tf
import numpy as np
from tensorflow.examples.tutorials.mnist import input_data
mnist=input_data.read_data_sets('mnist/',one_hot=True)

learning_rate=0.001
batch_size=128

n_input=28
n_steps=28
n_hidden=128
n_classes=10

x=tf.placeholder(tf.float32,[None,n_steps,n_input])
y=tf.placeholder(tf.float32,[None,n_classes])
output, _=tf.nn.dynamic_rnn(
            tf.contrib.rnn.GRUCell(n_hidden),
            x,
            dtype=tf.float32,
            sequence_length=batch_size*[n_input],

)


print(sess.run(hello))