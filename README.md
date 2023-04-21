# Quantitative Structure-Property Relationship (QSPR) Model for Predicting Phase Change Properties of Organic Compounds Using Machine Learning
Knowledge of critical and phase change properties of organic compounds is essential to understanding 
the thermodynamic behavior of substances, especially in the study of reactive processes. In the case 
where phase change data are unavailable or alternative methods to costly and time-consuming laboratory 
experiments are desired, quantitative structure−property relationship (QSPR) regression methods can 
be used to relate molecular descriptors to properties of interest. In this work, an artificial neural 
network (ANN) method was used to develop a QSPR based model for the prediction of phase change 
properties based on experimental data for 380 pure compounds. The phase change properties of 
interest in this study are normal boiling point, critical pressure, critical temperature, the ratio 
of critical temperature to critical pressure, and critical density. The database of organic compounds 
that was used to build the ML model comprised a wide range of chemical families: hydrocarbons, ketones,
aldehydes, carboxylic acids and salts, nitriles, alcohols, amines, ethers, heterocyclic compounds,
esters, acetals, and organic peroxides. Python based cheminformatics software packages were used to obtain the molecular structure information (115 descriptors) for the diverse set of compounds. A review of prior literature was conducted to decide which molecular descriptors would need to be calculated to construct the initial set of molecular properties. One of the main challenges in this study was the selection of relevant descriptors. Principal component analysis (PCA) was employed to project the original feature set a lower dimensional set of to use as inputs to the ANN. The hyperparameters of the ANN were configured and optimized using KerasTuner, a scalable hyperparameter optimization framework that facilitates hyperparameter search. After the final model was trained, the predicted results were compared with respect to experimental data.
