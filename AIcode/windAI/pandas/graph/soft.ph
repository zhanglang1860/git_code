
A
x_inputPlaceholder*
dtype0*
shape:���������
A
y_inputPlaceholder*
dtype0*
shape:���������
K
truncated_normal/shapeConst*
valueB"      *
dtype0
B
truncated_normal/meanConst*
valueB
 *    *
dtype0
D
truncated_normal/stddevConst*
valueB
 *  �?*
dtype0
z
 truncated_normal/TruncatedNormalTruncatedNormaltruncated_normal/shape*
T0*
dtype0*
seed2 *

seed 
_
truncated_normal/mulMul truncated_normal/TruncatedNormaltruncated_normal/stddev*
T0
M
truncated_normalAddtruncated_normal/multruncated_normal/mean*
T0
b
pandas_weights
VariableV2*
dtype0*
shared_name *
	container *
shape
:
�
pandas_weights/AssignAssignpandas_weightstruncated_normal*
T0*
use_locking(*
validate_shape(*!
_class
loc:@pandas_weights
[
pandas_weights/readIdentitypandas_weights*
T0*!
_class
loc:@pandas_weights
F
truncated_normal_1/shapeConst*
valueB:*
dtype0
D
truncated_normal_1/meanConst*
valueB
 *    *
dtype0
F
truncated_normal_1/stddevConst*
valueB
 *  �?*
dtype0
~
"truncated_normal_1/TruncatedNormalTruncatedNormaltruncated_normal_1/shape*
T0*
dtype0*
seed2 *

seed 
e
truncated_normal_1/mulMul"truncated_normal_1/TruncatedNormaltruncated_normal_1/stddev*
T0
S
truncated_normal_1Addtruncated_normal_1/multruncated_normal_1/mean*
T0
[
pandas_bias
VariableV2*
dtype0*
shared_name *
	container *
shape:
�
pandas_bias/AssignAssignpandas_biastruncated_normal_1*
T0*
use_locking(*
validate_shape(*
_class
loc:@pandas_bias
R
pandas_bias/readIdentitypandas_bias*
T0*
_class
loc:@pandas_bias
]
MatMulMatMulx_inputpandas_weights/read*
T0*
transpose_b( *
transpose_a( 
>
pandas_combine_inputAddMatMulpandas_bias/read*
T0
6
final_resultSoftmaxpandas_combine_input*
T0
[
9softmax_cross_entropy_with_logits_sg/labels_stop_gradientStopGradienty_input*
T0
S
)softmax_cross_entropy_with_logits_sg/RankConst*
value	B :*
dtype0
b
*softmax_cross_entropy_with_logits_sg/ShapeShapepandas_combine_input*
T0*
out_type0
U
+softmax_cross_entropy_with_logits_sg/Rank_1Const*
value	B :*
dtype0
d
,softmax_cross_entropy_with_logits_sg/Shape_1Shapepandas_combine_input*
T0*
out_type0
T
*softmax_cross_entropy_with_logits_sg/Sub/yConst*
value	B :*
dtype0
�
(softmax_cross_entropy_with_logits_sg/SubSub+softmax_cross_entropy_with_logits_sg/Rank_1*softmax_cross_entropy_with_logits_sg/Sub/y*
T0
�
0softmax_cross_entropy_with_logits_sg/Slice/beginPack(softmax_cross_entropy_with_logits_sg/Sub*

axis *
T0*
N
]
/softmax_cross_entropy_with_logits_sg/Slice/sizeConst*
valueB:*
dtype0
�
*softmax_cross_entropy_with_logits_sg/SliceSlice,softmax_cross_entropy_with_logits_sg/Shape_10softmax_cross_entropy_with_logits_sg/Slice/begin/softmax_cross_entropy_with_logits_sg/Slice/size*
Index0*
T0
k
4softmax_cross_entropy_with_logits_sg/concat/values_0Const*
valueB:
���������*
dtype0
Z
0softmax_cross_entropy_with_logits_sg/concat/axisConst*
value	B : *
dtype0
�
+softmax_cross_entropy_with_logits_sg/concatConcatV24softmax_cross_entropy_with_logits_sg/concat/values_0*softmax_cross_entropy_with_logits_sg/Slice0softmax_cross_entropy_with_logits_sg/concat/axis*
T0*
N*

Tidx0
�
,softmax_cross_entropy_with_logits_sg/ReshapeReshapepandas_combine_input+softmax_cross_entropy_with_logits_sg/concat*
T0*
Tshape0
U
+softmax_cross_entropy_with_logits_sg/Rank_2Const*
value	B :*
dtype0
�
,softmax_cross_entropy_with_logits_sg/Shape_2Shape9softmax_cross_entropy_with_logits_sg/labels_stop_gradient*
T0*
out_type0
V
,softmax_cross_entropy_with_logits_sg/Sub_1/yConst*
value	B :*
dtype0
�
*softmax_cross_entropy_with_logits_sg/Sub_1Sub+softmax_cross_entropy_with_logits_sg/Rank_2,softmax_cross_entropy_with_logits_sg/Sub_1/y*
T0
�
2softmax_cross_entropy_with_logits_sg/Slice_1/beginPack*softmax_cross_entropy_with_logits_sg/Sub_1*

axis *
T0*
N
_
1softmax_cross_entropy_with_logits_sg/Slice_1/sizeConst*
valueB:*
dtype0
�
,softmax_cross_entropy_with_logits_sg/Slice_1Slice,softmax_cross_entropy_with_logits_sg/Shape_22softmax_cross_entropy_with_logits_sg/Slice_1/begin1softmax_cross_entropy_with_logits_sg/Slice_1/size*
Index0*
T0
m
6softmax_cross_entropy_with_logits_sg/concat_1/values_0Const*
valueB:
���������*
dtype0
\
2softmax_cross_entropy_with_logits_sg/concat_1/axisConst*
value	B : *
dtype0
�
-softmax_cross_entropy_with_logits_sg/concat_1ConcatV26softmax_cross_entropy_with_logits_sg/concat_1/values_0,softmax_cross_entropy_with_logits_sg/Slice_12softmax_cross_entropy_with_logits_sg/concat_1/axis*
T0*
N*

Tidx0
�
.softmax_cross_entropy_with_logits_sg/Reshape_1Reshape9softmax_cross_entropy_with_logits_sg/labels_stop_gradient-softmax_cross_entropy_with_logits_sg/concat_1*
T0*
Tshape0
�
$softmax_cross_entropy_with_logits_sgSoftmaxCrossEntropyWithLogits,softmax_cross_entropy_with_logits_sg/Reshape.softmax_cross_entropy_with_logits_sg/Reshape_1*
T0
V
,softmax_cross_entropy_with_logits_sg/Sub_2/yConst*
value	B :*
dtype0
�
*softmax_cross_entropy_with_logits_sg/Sub_2Sub)softmax_cross_entropy_with_logits_sg/Rank,softmax_cross_entropy_with_logits_sg/Sub_2/y*
T0
`
2softmax_cross_entropy_with_logits_sg/Slice_2/beginConst*
valueB: *
dtype0
�
1softmax_cross_entropy_with_logits_sg/Slice_2/sizePack*softmax_cross_entropy_with_logits_sg/Sub_2*

axis *
T0*
N
�
,softmax_cross_entropy_with_logits_sg/Slice_2Slice*softmax_cross_entropy_with_logits_sg/Shape2softmax_cross_entropy_with_logits_sg/Slice_2/begin1softmax_cross_entropy_with_logits_sg/Slice_2/size*
Index0*
T0
�
.softmax_cross_entropy_with_logits_sg/Reshape_2Reshape$softmax_cross_entropy_with_logits_sg,softmax_cross_entropy_with_logits_sg/Slice_2*
T0*
Tshape0
3
ConstConst*
valueB: *
dtype0
i
MeanMean.softmax_cross_entropy_with_logits_sg/Reshape_2Const*
	keep_dims( *
T0*

Tidx0
:
ArgMax/dimensionConst*
value	B :*
dtype0
X
ArgMaxArgMaxfinal_resultArgMax/dimension*
output_type0	*
T0*

Tidx0
<
ArgMax_1/dimensionConst*
value	B :*
dtype0
W
ArgMax_1ArgMaxy_inputArgMax_1/dimension*
output_type0	*
T0*

Tidx0
)
EqualEqualArgMaxArgMax_1*
T0	
+
CastCastEqual*

DstT0*

SrcT0

5
Const_1Const*
valueB: *
dtype0
C
Mean_1MeanCastConst_1*
	keep_dims( *
T0*

Tidx0
8
gradients/ShapeConst*
valueB *
dtype0
@
gradients/grad_ys_0Const*
valueB
 *  �?*
dtype0
W
gradients/FillFillgradients/Shapegradients/grad_ys_0*
T0*

index_type0
O
!gradients/Mean_grad/Reshape/shapeConst*
valueB:*
dtype0
p
gradients/Mean_grad/ReshapeReshapegradients/Fill!gradients/Mean_grad/Reshape/shape*
T0*
Tshape0
k
gradients/Mean_grad/ShapeShape.softmax_cross_entropy_with_logits_sg/Reshape_2*
T0*
out_type0
s
gradients/Mean_grad/TileTilegradients/Mean_grad/Reshapegradients/Mean_grad/Shape*
T0*

Tmultiples0
m
gradients/Mean_grad/Shape_1Shape.softmax_cross_entropy_with_logits_sg/Reshape_2*
T0*
out_type0
D
gradients/Mean_grad/Shape_2Const*
valueB *
dtype0
G
gradients/Mean_grad/ConstConst*
valueB: *
dtype0
~
gradients/Mean_grad/ProdProdgradients/Mean_grad/Shape_1gradients/Mean_grad/Const*
	keep_dims( *
T0*

Tidx0
I
gradients/Mean_grad/Const_1Const*
valueB: *
dtype0
�
gradients/Mean_grad/Prod_1Prodgradients/Mean_grad/Shape_2gradients/Mean_grad/Const_1*
	keep_dims( *
T0*

Tidx0
G
gradients/Mean_grad/Maximum/yConst*
value	B :*
dtype0
j
gradients/Mean_grad/MaximumMaximumgradients/Mean_grad/Prod_1gradients/Mean_grad/Maximum/y*
T0
h
gradients/Mean_grad/floordivFloorDivgradients/Mean_grad/Prodgradients/Mean_grad/Maximum*
T0
V
gradients/Mean_grad/CastCastgradients/Mean_grad/floordiv*

DstT0*

SrcT0
c
gradients/Mean_grad/truedivRealDivgradients/Mean_grad/Tilegradients/Mean_grad/Cast*
T0
�
Cgradients/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/ShapeShape$softmax_cross_entropy_with_logits_sg*
T0*
out_type0
�
Egradients/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/ReshapeReshapegradients/Mean_grad/truedivCgradients/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/Shape*
T0*
Tshape0
R
gradients/zeros_like	ZerosLike&softmax_cross_entropy_with_logits_sg:1*
T0
u
Bgradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims/dimConst*
valueB :
���������*
dtype0
�
>gradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims
ExpandDimsEgradients/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/ReshapeBgradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims/dim*
T0*

Tdim0
�
7gradients/softmax_cross_entropy_with_logits_sg_grad/mulMul>gradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims&softmax_cross_entropy_with_logits_sg:1*
T0
�
>gradients/softmax_cross_entropy_with_logits_sg_grad/LogSoftmax
LogSoftmax,softmax_cross_entropy_with_logits_sg/Reshape*
T0
�
7gradients/softmax_cross_entropy_with_logits_sg_grad/NegNeg>gradients/softmax_cross_entropy_with_logits_sg_grad/LogSoftmax*
T0
w
Dgradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_1/dimConst*
valueB :
���������*
dtype0
�
@gradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_1
ExpandDimsEgradients/softmax_cross_entropy_with_logits_sg/Reshape_2_grad/ReshapeDgradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_1/dim*
T0*

Tdim0
�
9gradients/softmax_cross_entropy_with_logits_sg_grad/mul_1Mul@gradients/softmax_cross_entropy_with_logits_sg_grad/ExpandDims_17gradients/softmax_cross_entropy_with_logits_sg_grad/Neg*
T0
�
Dgradients/softmax_cross_entropy_with_logits_sg_grad/tuple/group_depsNoOp8^gradients/softmax_cross_entropy_with_logits_sg_grad/mul:^gradients/softmax_cross_entropy_with_logits_sg_grad/mul_1
�
Lgradients/softmax_cross_entropy_with_logits_sg_grad/tuple/control_dependencyIdentity7gradients/softmax_cross_entropy_with_logits_sg_grad/mulE^gradients/softmax_cross_entropy_with_logits_sg_grad/tuple/group_deps*
T0*J
_class@
><loc:@gradients/softmax_cross_entropy_with_logits_sg_grad/mul
�
Ngradients/softmax_cross_entropy_with_logits_sg_grad/tuple/control_dependency_1Identity9gradients/softmax_cross_entropy_with_logits_sg_grad/mul_1E^gradients/softmax_cross_entropy_with_logits_sg_grad/tuple/group_deps*
T0*L
_classB
@>loc:@gradients/softmax_cross_entropy_with_logits_sg_grad/mul_1
y
Agradients/softmax_cross_entropy_with_logits_sg/Reshape_grad/ShapeShapepandas_combine_input*
T0*
out_type0
�
Cgradients/softmax_cross_entropy_with_logits_sg/Reshape_grad/ReshapeReshapeLgradients/softmax_cross_entropy_with_logits_sg_grad/tuple/control_dependencyAgradients/softmax_cross_entropy_with_logits_sg/Reshape_grad/Shape*
T0*
Tshape0
S
)gradients/pandas_combine_input_grad/ShapeShapeMatMul*
T0*
out_type0
Y
+gradients/pandas_combine_input_grad/Shape_1Const*
valueB:*
dtype0
�
9gradients/pandas_combine_input_grad/BroadcastGradientArgsBroadcastGradientArgs)gradients/pandas_combine_input_grad/Shape+gradients/pandas_combine_input_grad/Shape_1*
T0
�
'gradients/pandas_combine_input_grad/SumSumCgradients/softmax_cross_entropy_with_logits_sg/Reshape_grad/Reshape9gradients/pandas_combine_input_grad/BroadcastGradientArgs*
	keep_dims( *
T0*

Tidx0
�
+gradients/pandas_combine_input_grad/ReshapeReshape'gradients/pandas_combine_input_grad/Sum)gradients/pandas_combine_input_grad/Shape*
T0*
Tshape0
�
)gradients/pandas_combine_input_grad/Sum_1SumCgradients/softmax_cross_entropy_with_logits_sg/Reshape_grad/Reshape;gradients/pandas_combine_input_grad/BroadcastGradientArgs:1*
	keep_dims( *
T0*

Tidx0
�
-gradients/pandas_combine_input_grad/Reshape_1Reshape)gradients/pandas_combine_input_grad/Sum_1+gradients/pandas_combine_input_grad/Shape_1*
T0*
Tshape0
�
4gradients/pandas_combine_input_grad/tuple/group_depsNoOp,^gradients/pandas_combine_input_grad/Reshape.^gradients/pandas_combine_input_grad/Reshape_1
�
<gradients/pandas_combine_input_grad/tuple/control_dependencyIdentity+gradients/pandas_combine_input_grad/Reshape5^gradients/pandas_combine_input_grad/tuple/group_deps*
T0*>
_class4
20loc:@gradients/pandas_combine_input_grad/Reshape
�
>gradients/pandas_combine_input_grad/tuple/control_dependency_1Identity-gradients/pandas_combine_input_grad/Reshape_15^gradients/pandas_combine_input_grad/tuple/group_deps*
T0*@
_class6
42loc:@gradients/pandas_combine_input_grad/Reshape_1
�
gradients/MatMul_grad/MatMulMatMul<gradients/pandas_combine_input_grad/tuple/control_dependencypandas_weights/read*
T0*
transpose_b(*
transpose_a( 
�
gradients/MatMul_grad/MatMul_1MatMulx_input<gradients/pandas_combine_input_grad/tuple/control_dependency*
T0*
transpose_b( *
transpose_a(
n
&gradients/MatMul_grad/tuple/group_depsNoOp^gradients/MatMul_grad/MatMul^gradients/MatMul_grad/MatMul_1
�
.gradients/MatMul_grad/tuple/control_dependencyIdentitygradients/MatMul_grad/MatMul'^gradients/MatMul_grad/tuple/group_deps*
T0*/
_class%
#!loc:@gradients/MatMul_grad/MatMul
�
0gradients/MatMul_grad/tuple/control_dependency_1Identitygradients/MatMul_grad/MatMul_1'^gradients/MatMul_grad/tuple/group_deps*
T0*1
_class'
%#loc:@gradients/MatMul_grad/MatMul_1
f
beta1_power/initial_valueConst*
valueB
 *fff?*
dtype0*
_class
loc:@pandas_bias
w
beta1_power
VariableV2*
dtype0*
shared_name *
	container *
shape: *
_class
loc:@pandas_bias
�
beta1_power/AssignAssignbeta1_powerbeta1_power/initial_value*
T0*
use_locking(*
validate_shape(*
_class
loc:@pandas_bias
R
beta1_power/readIdentitybeta1_power*
T0*
_class
loc:@pandas_bias
f
beta2_power/initial_valueConst*
valueB
 *w�?*
dtype0*
_class
loc:@pandas_bias
w
beta2_power
VariableV2*
dtype0*
shared_name *
	container *
shape: *
_class
loc:@pandas_bias
�
beta2_power/AssignAssignbeta2_powerbeta2_power/initial_value*
T0*
use_locking(*
validate_shape(*
_class
loc:@pandas_bias
R
beta2_power/readIdentitybeta2_power*
T0*
_class
loc:@pandas_bias
}
%pandas_weights/Adam/Initializer/zerosConst*
valueB*    *
dtype0*!
_class
loc:@pandas_weights
�
pandas_weights/Adam
VariableV2*
dtype0*
shared_name *
	container *
shape
:*!
_class
loc:@pandas_weights
�
pandas_weights/Adam/AssignAssignpandas_weights/Adam%pandas_weights/Adam/Initializer/zeros*
T0*
use_locking(*
validate_shape(*!
_class
loc:@pandas_weights
e
pandas_weights/Adam/readIdentitypandas_weights/Adam*
T0*!
_class
loc:@pandas_weights

'pandas_weights/Adam_1/Initializer/zerosConst*
valueB*    *
dtype0*!
_class
loc:@pandas_weights
�
pandas_weights/Adam_1
VariableV2*
dtype0*
shared_name *
	container *
shape
:*!
_class
loc:@pandas_weights
�
pandas_weights/Adam_1/AssignAssignpandas_weights/Adam_1'pandas_weights/Adam_1/Initializer/zeros*
T0*
use_locking(*
validate_shape(*!
_class
loc:@pandas_weights
i
pandas_weights/Adam_1/readIdentitypandas_weights/Adam_1*
T0*!
_class
loc:@pandas_weights
s
"pandas_bias/Adam/Initializer/zerosConst*
valueB*    *
dtype0*
_class
loc:@pandas_bias
�
pandas_bias/Adam
VariableV2*
dtype0*
shared_name *
	container *
shape:*
_class
loc:@pandas_bias
�
pandas_bias/Adam/AssignAssignpandas_bias/Adam"pandas_bias/Adam/Initializer/zeros*
T0*
use_locking(*
validate_shape(*
_class
loc:@pandas_bias
\
pandas_bias/Adam/readIdentitypandas_bias/Adam*
T0*
_class
loc:@pandas_bias
u
$pandas_bias/Adam_1/Initializer/zerosConst*
valueB*    *
dtype0*
_class
loc:@pandas_bias
�
pandas_bias/Adam_1
VariableV2*
dtype0*
shared_name *
	container *
shape:*
_class
loc:@pandas_bias
�
pandas_bias/Adam_1/AssignAssignpandas_bias/Adam_1$pandas_bias/Adam_1/Initializer/zeros*
T0*
use_locking(*
validate_shape(*
_class
loc:@pandas_bias
`
pandas_bias/Adam_1/readIdentitypandas_bias/Adam_1*
T0*
_class
loc:@pandas_bias
?
Adam/learning_rateConst*
valueB
 *o:*
dtype0
7

Adam/beta1Const*
valueB
 *fff?*
dtype0
7

Adam/beta2Const*
valueB
 *w�?*
dtype0
9
Adam/epsilonConst*
valueB
 *w�+2*
dtype0
�
$Adam/update_pandas_weights/ApplyAdam	ApplyAdampandas_weightspandas_weights/Adampandas_weights/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon0gradients/MatMul_grad/tuple/control_dependency_1*
T0*
use_locking( *
use_nesterov( *!
_class
loc:@pandas_weights
�
!Adam/update_pandas_bias/ApplyAdam	ApplyAdampandas_biaspandas_bias/Adampandas_bias/Adam_1beta1_power/readbeta2_power/readAdam/learning_rate
Adam/beta1
Adam/beta2Adam/epsilon>gradients/pandas_combine_input_grad/tuple/control_dependency_1*
T0*
use_locking( *
use_nesterov( *
_class
loc:@pandas_bias
�
Adam/mulMulbeta1_power/read
Adam/beta1"^Adam/update_pandas_bias/ApplyAdam%^Adam/update_pandas_weights/ApplyAdam*
T0*
_class
loc:@pandas_bias
~
Adam/AssignAssignbeta1_powerAdam/mul*
T0*
use_locking( *
validate_shape(*
_class
loc:@pandas_bias
�

Adam/mul_1Mulbeta2_power/read
Adam/beta2"^Adam/update_pandas_bias/ApplyAdam%^Adam/update_pandas_weights/ApplyAdam*
T0*
_class
loc:@pandas_bias
�
Adam/Assign_1Assignbeta2_power
Adam/mul_1*
T0*
use_locking( *
validate_shape(*
_class
loc:@pandas_bias
u
AdamNoOp^Adam/Assign^Adam/Assign_1"^Adam/update_pandas_bias/ApplyAdam%^Adam/update_pandas_weights/ApplyAdam
�
initNoOp^beta1_power/Assign^beta2_power/Assign^pandas_bias/Adam/Assign^pandas_bias/Adam_1/Assign^pandas_bias/Assign^pandas_weights/Adam/Assign^pandas_weights/Adam_1/Assign^pandas_weights/Assign
8

save/ConstConst*
valueB Bmodel*
dtype0
�
save/SaveV2/tensor_namesConst*�
value�B�Bbeta1_powerBbeta2_powerBpandas_biasBpandas_bias/AdamBpandas_bias/Adam_1Bpandas_weightsBpandas_weights/AdamBpandas_weights/Adam_1*
dtype0
W
save/SaveV2/shape_and_slicesConst*#
valueBB B B B B B B B *
dtype0
�
save/SaveV2SaveV2
save/Constsave/SaveV2/tensor_namessave/SaveV2/shape_and_slicesbeta1_powerbeta2_powerpandas_biaspandas_bias/Adampandas_bias/Adam_1pandas_weightspandas_weights/Adampandas_weights/Adam_1*
dtypes

2
e
save/control_dependencyIdentity
save/Const^save/SaveV2*
T0*
_class
loc:@save/Const
�
save/RestoreV2/tensor_namesConst"/device:CPU:0*�
value�B�Bbeta1_powerBbeta2_powerBpandas_biasBpandas_bias/AdamBpandas_bias/Adam_1Bpandas_weightsBpandas_weights/AdamBpandas_weights/Adam_1*
dtype0
i
save/RestoreV2/shape_and_slicesConst"/device:CPU:0*#
valueBB B B B B B B B *
dtype0
�
save/RestoreV2	RestoreV2
save/Constsave/RestoreV2/tensor_namessave/RestoreV2/shape_and_slices"/device:CPU:0*
dtypes

2
�
save/AssignAssignbeta1_powersave/RestoreV2*
T0*
use_locking(*
validate_shape(*
_class
loc:@pandas_bias
�
save/Assign_1Assignbeta2_powersave/RestoreV2:1*
T0*
use_locking(*
validate_shape(*
_class
loc:@pandas_bias
�
save/Assign_2Assignpandas_biassave/RestoreV2:2*
T0*
use_locking(*
validate_shape(*
_class
loc:@pandas_bias
�
save/Assign_3Assignpandas_bias/Adamsave/RestoreV2:3*
T0*
use_locking(*
validate_shape(*
_class
loc:@pandas_bias
�
save/Assign_4Assignpandas_bias/Adam_1save/RestoreV2:4*
T0*
use_locking(*
validate_shape(*
_class
loc:@pandas_bias
�
save/Assign_5Assignpandas_weightssave/RestoreV2:5*
T0*
use_locking(*
validate_shape(*!
_class
loc:@pandas_weights
�
save/Assign_6Assignpandas_weights/Adamsave/RestoreV2:6*
T0*
use_locking(*
validate_shape(*!
_class
loc:@pandas_weights
�
save/Assign_7Assignpandas_weights/Adam_1save/RestoreV2:7*
T0*
use_locking(*
validate_shape(*!
_class
loc:@pandas_weights
�
save/restore_allNoOp^save/Assign^save/Assign_1^save/Assign_2^save/Assign_3^save/Assign_4^save/Assign_5^save/Assign_6^save/Assign_7"