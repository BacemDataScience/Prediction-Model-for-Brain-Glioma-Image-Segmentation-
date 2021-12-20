% This make.m is used under Windows

mex -c svm.cpp
mex -c svm_model_matlab.c
mex svmtrain.c svm.obj svm_model_matlab.obj
mex svmpredict.c svm.obj svm_model_matlab.obj
