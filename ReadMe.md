##DMLDA-LocLIFT

Identification of multi-label protein subcellular localization using DMLDA dimensionality reduction and LIFT classifier

###Guiding principles:

**The dataset file contains Gram-negative bacteria dataset, Gram-positive bacteria dataset and plant dataset.

**Feature extraction
1) Evolutionary information: 
   psepssm.m is the implementation of PsePSSM.
2) Physicochemical_information: 
   PAAC.m,mainpseaac.m is the implementation of PseAAC.
   ebgw1.m,ebgw2.m,ebgw3.m,lizhuebgw.m is the implementation of EBGW.
3) Sequence_information:
   Dipeptide composition can be found from http://www.csbio.sjtu.edu.cn/bioinf/PseAAC/#.
4) Annotation information：
   Gene Ontology can be found from http://www.ebi.ac.uk/GOA/.
** Dimensional reduction:
   DMLDA_transform.m represents the DMLDA.
   MDDM_transform.m represents MDDM.
   PCA_transform.m represents PCA.
   MLSI_transform represents MLSI.
   MVMD_transform represents MVMD.

** Classifier:
   LIFT.m is the implementation of LIFT.
   MLKNN_test.m,MLKNN_train.m are the implementation of MLKNN.
   InsDif.m is the implementation of InsDif.
   MLLOC.m is the implementation of MLLOC.

** independent_test:
   The independent_test file contains the code of the test of independent dataset. 

** Demo:
   Run the demo.m in MATLAB,and you can choose different dimensionality reduction methods and classifiers.