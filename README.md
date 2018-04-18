# GRN_MIC
Gene Regulatory Network Inference using Maximal Information Coefficient . 
### Thesis "Gene Regulatory Network Inference using Maximal Information Coefficeint"
  Supervised by Prof. Dr. Md. Aminul Haque Akand
 Department of CSE, Khulna University of Engineering and Technology , Bangladesh

Gene Regulatory Network (GRN) plays an important role to understand the interactions and dependencies of genes in different conditions from gene expression data. An information theoretic GRN method first computes dependency matrix from the given gene expression dataset using an entropy estimator and then infer network using individual inference method. A number of prominent methods use Mutual Information (MI) and its variants for dependency measure because MI is an efficient approach to detect nonlinear dependencies. But MI does not work well for continuous multivariate variables. In this paper, we have investigated the recently proposed association detector method Maximal Information Coefficient (MIC), instead of MI, in inferring GRN. It is reported that MIC can detect effectively most forms of statistical dependence between pairs of variables. We have integrated MIC with two prominent MI based GRN inference methods Minimal Redundancy Network and Context Likelihood of Relatedness. The experimental studies on DREAM3 Yeast data, SynTReN generated synthetic data and SOS E. Coli real gene expression data revealed that inferred network with MIC based proposed methods outperformed their counter MI based standard methods in most of the cases, especially for large sized problem

## Method 

Maximal Information Coefficient 

MRNET(Minimum Redundancy Netowrk) 

CLR(Context Likelihood Relatedness)

## Data Description 
 Yeast Data, Noisy Data, Ecoli data

