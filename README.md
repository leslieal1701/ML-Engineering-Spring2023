# Quantitative Structure-Property Relationship (QSPR) Models for Predicting Phase Change Properties of Organic Compounds Using Machine Learning
Knowledge of critical and phase change properties of organic compounds is essential to understanding 
the thermodynamic behavior of substances, especially in the study of reactive processes. In the case 
where phase change data is unavailable or alternative methods to costly and time-consuming laboratory 
experiments are desired, quantitative structure−property relationship (QSPR) regression methods can 
be used to relate molecular descriptors to properties of interest. In this work, an artificial neural 
network (ANN) method will be used to develop QSPR based models for the prediction of phase change 
properties based on experimental data for over 300 pure compounds. The phase change properties of 
interest in this study are normal boiling point, critical pressure, critical temperature, flash point, and 
heat of vaporization. The database of organic compounds that will be used to build the ML model 
comprises a wide range of chemical families: hydrocarbons, ketones, aldehydes, carboxylic acids and 
salts, nitriles, alcohols, amines, ethers, heterocyclic compounds, esters, acetals, and organic peroxides.
Python based cheminformatics software packages were used to obtain the molecular structure 
information (115 descriptors) for the diverse set of compounds. A review of prior literature was 
conducted to decide which molecular descriptors would need to be calculated to construct the initial set 
of molecular properties. One of the main challenges in this study is the selection of the relevant
descriptors. A statistical methodology will be employed in this study to reduce the number of 
descriptors used to build the QSPR model. This will involve removing descriptors with an intercorrelation 
Pearson coefficient of more than 0.85. The hyperparameters of the artificial neural network will be 
configured and optimized using KerasTuner, a scalable hyperparameter optimization framework that 
facilitates hyperparameter search. After the final model has been trained, the predicted results will be
compared with respect to experimental data and predictions of existing models in the literature.
