(* ::Package:: *)

BeginPackage["QMath`"]

Print[Style["The Mathematica Package For Algebraic Calculation In Quantum Field Theory",FontFamily->"Arial",FontSize->15]]
Print[Style["QMath Version : 1.0",FontFamily->"Arial",FontSize->15]]


$PrePrint=TraditionalForm;


(* ::Section:: *)
(*\:51fd\:6570\:5217\:8868*)


(* ::Subsection:: *)
(*\:72c4\:62c9\:514b\:77e9\:9635\:4ee3\:6570*)


DGamma::usage="
DGamma[a] \:72c4\:62c9\:514b\:77e9\:9635 \!\(\*SuperscriptBox[\(\[Gamma]\), \(a\)]\)
\n
DGamma[a,b,...] \:72c4\:62c9\:514b\:77e9\:9635\:7684\:70b9\:79ef";

DGamma5::usage="DGamma5 \:72c4\:62c9\:514b\:77e9\:9635\:4f3d\:9a6c5 \!\(\*SuperscriptBox[\(\[Gamma]\), \(5\)]\)";
SU3T::usage="SU3T[a] SU3\:7684\:751f\:6210\:5143\:77e9\:9635 \!\(\*SuperscriptBox[\(T\), \(a\)]\)";
FSlash::usage = "FSlash[p] \:8d39\:66fc\:7f29\:5e76 p.\[Gamma]";
UCFSlash::usage = "UCFSlash[p] \:5e26\:6d1b\:4f26\:5179\:6307\:6807\:7684\:8d39\:66fc\:7f29\:5e76 \!\(\*SuperscriptBox[\(p\), \(a\)]\)\!\(\*SubscriptBox[\(\[Gamma]\), \(a\)]\)";
Sigma::usage="Sigma[a,b] \:6ce1\:5229\:77e9\:9635 \!\(\*SuperscriptBox[\(\[Sigma]\), \(ab\)]\)=
\!\(\*FractionBox[\(i\), \(2\)]\) [\!\(\*SuperscriptBox[\(\[Gamma]\), \(a\)]\),\!\(\*SuperscriptBox[\(\[Gamma]\), \(b\)]\)]";
CCM::usage="CCM \:7535\:8377\:5171\:8f6d\:77e9\:9635 C=i \!\(\*SuperscriptBox[\(\[Gamma]\), \(2\)]\).\!\(\*SuperscriptBox[\(\[Gamma]\), \(0\)]\)";

SuperT::usage="SuperT[A] \:77e9\:9635\:8f6c\:7f6e\:7b26\:53f7 \!\(\*SuperscriptBox[\(A\), \(T\)]\)";
MTranspose::usage="\:77e9\:9635\:8f6c\:7f6e\:8fd0\:7b97";

DTrace::usage="\:77e9\:9635\:6c42\:8ff9\:7b97\:7b26,\:642d\:914dTrSimplify\:4f7f\:7528";
GammaQ::usage="GammaQ[f] \:5982\:679cf\:4e0d\:5305\:542b\:72c4\:62c9\:514b\:77e9\:9635\:5219\:7ed9\:51faTrue\:ff0c\:5426\:5219\:7ed9\:51faFalse";
RotateTrace::usage="\:77e9\:9635\:6c42\:8ff9\:8f6e\:6362";
DotSimplify::usage="\:77e9\:9635\:4e58\:6cd5\:5316\:7b80";
TrSimplify::usage="TrSimplify[DTrace[DGamma[a].DGamma[b]]]\:72c4\:62c9\:514b\:77e9\:9635\:6c42\:8ff9";

MatrixElement::usage="MatrixElement[A,{a,b}] \:5e26\:6307\:6807\:7684\:77e9\:9635 \!\(\*SubscriptBox[\(A\), \(ab\)]\)";
MContract::usage="\:77e9\:9635\:6307\:6807\:6536\:7f29";
ComplexConjugate::usage="\:590d\:6570\:5171\:8f6d";
DSpinorTraceCycle::usage="DSpinorTraceCycle[f]\:72c4\:62c9\:514b\:65cb\:91cf\:8f6e\:6362\:6c42\:8ff9 
\!\(\*OverscriptBox[\(u\), \(_\)]\)\[CapitalGamma]v\[RightArrow]tr[\[CapitalGamma]v\!\(\*OverscriptBox[\(u\), \(_\)]\)]";
PolarSum::usage="\:81ea\:65cb\:6781\:5316\:6c42\:548c";


(* ::Subsection:: *)
(*\:5f20\:91cf\:4ee3\:6570*)


Tensor::usage="Tensor[T,{a,...},{b,...},n] n\:7ef4\:5f20\:91cf \!\(\*SubsuperscriptBox[\(T\), \(b ... \), \(a ... \)]\)";
UTensor::usage="UTensor[T,{a,...},n] n\:7ef4\:4e0a\:6307\:6807\:9006\:53d8\:5f20\:91cf \!\(\*SuperscriptBox[\(T\), \(a ... \)]\)";
SUTensor::usage="SUTensor[T,{a,...},n] n\:7ef4\:5bf9\:79f0\:4e0a\:6307\:6807\:9006\:53d8\:5f20\:91cf \!\(\*SuperscriptBox[\(T\), \(a ... \)]\)";
AUTensor::usage="AUTensor[T,{a,...},n] n\:7ef4\:53cd\:5bf9\:79f0\:4e0a\:6307\:6807\:9006\:53d8\:5f20\:91cf \!\(\*SuperscriptBox[\(T\), \(a ... \)]\)";
DTensor::usage="DTensor[T,{a,...},n] n\:7ef4\:4e0b\:6307\:6807\:534f\:53d8\:5f20\:91cf \!\(\*SubscriptBox[\(T\), \(a ... \)]\)";
MTensor::usage="MTensor[a,b] \:5ea6\:89c4\:5f20\:91cf \!\(\*SuperscriptBox[\(g\), \(ab\)]\)";
FVector::usage="FVector[p,a]  \:56db\:77e2\:91cf\!\(\*SuperscriptBox[\(p\), \(a\)]\)";
PolarVector::usage="PolarVector[V,{a,b,...},p] \:6781\:5316\:77e2\:91cf \!\(\*SubsuperscriptBox[\(\[Epsilon]\), \(ab ... \), \(V\)]\)(p)";
SDot::usage="SDot[A,B] \:56db\:77e2\:91cf\:7684\:6807\:91cf\:79ef A.B";
UCSDot::usage="UCSDot[A,B] \:5e26\:6d1b\:4f26\:5179\:6307\:6807\:7684\:56db\:77e2\:91cf\:6807\:91cf\:79ef \!\(\*SuperscriptBox[\(A\), \(a\)]\)\!\(\*SubscriptBox[\(B\), \(a\)]\)";


KDelta::usage="KDelta[{a,b},n] n\:7ef4\:7684\:514b\:7f57\:5185\:514b\:5fb3\:5854 \!\(\*SubscriptBox[\(\[Delta]\), \(ij\)]\)";
Epsilon3::usage="Epsilon3[a,b,c] 3\:9636\:53cd\:5bf9\:79f0\:5f20\:91cf\!\(\*SubscriptBox[\(\[Epsilon]\), \(abc\)]\)";
Epsilon4::usage="Epsilon4[a,b,c,d] 4\!\(\*SuperscriptBox[\(\:9636\:53cd\:5bf9\:79f0\:5f20\:91cf\[Epsilon]\), \(abcd\)]\)";
UCEpsilon4::usage="UCEpsilon4[a,FV[p],c,d] 4\!\(\*SuperscriptBox[\(\:77e2\:91cf\:4e0e4\:9636\:53cd\:5bf9\:79f0\:5f20\:91cf\:7684\:4e58\:79ef\[Epsilon]\), \(abcd\)]\)\!\(\*SubscriptBox[\(p\), \(b\)]\)";
SU3F::usage="SU3F[a,b,c] SU3\:7684\:7ed3\:6784\:5e38\:6570 \!\(\*SuperscriptBox[\(f\), \(abc\)]\)";


TContract::usage="\:5f20\:91cf\:6307\:6807\:6536\:7f29";
SchoutenSimplfy::usage="\:5229\:7528Schouten\:6052\:7b49\:5f0f\:5316\:7b80";
LContract::usage="\:6d1b\:4f26\:5179\:6307\:6807\:6536\:7f29";
UnContract::usage="\:6307\:6807\:4e0d\:6536\:7f29";


IndexCounter::usage="\:6307\:6807\:8ba1\:6570\:5668"; 
UniqueIndex::usage="UniqueIndex[a] \:6bcf\:6b21\:8c03\:7528\:751f\:6210\:4e0d\:91cd\:590d\:7684\:6307\:6807 aN\:ff08\:5047\:8bbeIndexCounter=N-1\:ff09
\n
UniqueIndex[a,N] \:6bcf\:6b21\:8c03\:7528\:751f\:6210\:4e0d\:91cd\:590d\:7684\:6307\:6807\:5217\:8868 {a1,a2,...aN}\:ff08\:5047\:8bbeIndexCounter=0\:ff09
\n
UniqueIndex[{a,b,...}] \:6bcf\:6b21\:8c03\:7528\:751f\:6210\:4e0d\:91cd\:590d\:7684\:6307\:6807\:5217\:8868 {aN,bN,...}\:ff08\:5047\:8bbeIndexCounter=N-1\:ff09";


General::DummyIndex ="\:6c42\:548c\:6307\:6807\:51fa\:73b0\:4e863\:6b21\:6216\:4ee5\:4e0a\:ff0c\:8ba1\:7b97\:9519\:8bef\:3002";
General::NoSolution="\:65b9\:7a0b\:7ec4\:65e0\:89e3";
CheckDummyIndices::usage="\:68c0\:67e5\:6c42\:548c\:6307\:6807\:662f\:5426\:91cd\:590d"; 
RenameDummyIndices::usage="\:56fa\:5b9a\:6c42\:548c\:6307\:6807\:ff0c\:4f7f\:5f97\:6bcf\:4e2a\:8868\:8fbe\:5f0f\:7684\:6307\:6807\:4e00\:6837"; 
RefreshDummyIndices::usage="\:5237\:65b0\:6c42\:548c\:6307\:6807\:ff0c\:4f7f\:5f97\:6bcf\:4e2a\:8868\:8fbe\:5f0f\:7684\:6307\:6807\:4e0d\:91cd\:590d"; 
OnShellSimplify::usage="OnShellSimplify[f,{{e1,p1},{e2,p2},...}]\:5229\:7528\:8d28\:80fd\:5173\:7cfb\:5bf9\:6807\:91cf\:79ef\:8fdb\:884c\:5316\:7b80"; 
KinematicSimplify::usage="KinematicSimplify[f,{Inp1,Inp2,...},{Outp1,Outp2,...},{SDot1,SDot2,...}]\:5229\:7528\:80fd\:91cf\:52a8\:91cf\:5b88\:6052\:5173\:7cfb\:5bf9\:6807\:91cf\:79ef\:8fdb\:884c\:5316\:7b80"; 


(* ::Subsection:: *)
(*\:7b97\:7b26\:4ee3\:6570*)


Mass::usage="Mass[A] \:8d28\:91cf \!\(\*SubscriptBox[\(m\), \(A\)]\)"; 
FV::usage="FV[p] 4\:77e2\:91cfp";
ChargedParticle::usage="ChargedParticle[P,Q]\:5e26\:7535\:8377Q\:7684\:7c92\:5b50P";


BState::usage="BState[{A,p}] \:73bb\:8272\:5b50\:5355\:7c92\:5b50\:6001 A(p) \n BState[{A,p},{B,k},...] \:73bb\:8272\:5b50\:591a\:7c92\:5b50\:6001 {A(p),B(k),...}";
FState::usage="FState[{A,p}] \:8d39\:7c73\:5b50\:5355\:7c92\:5b50\:6001 A(p) \n FState[{A,p},{B,k},...] \:8d39\:7c73\:5b50\:591a\:7c92\:5b50\:6001 {A(p),B(k),...}";


NewOperatorList::usage="NewOperatorList={A,B,...}\:81ea\:5b9a\:4e49\:7684\:7b97\:7b26";
OperatorQ::usage="OperatorQ[F]\:5982\:679cF\:4e0d\:5305\:542b\:7b97\:7b26\:5219\:7ed9\:51faTrue,\:5426\:5219\:7ed9\:51faFalse";
Annihilation::usage="Annihilation[a,p]\:6e6e\:706d\:7b97\:7b26a(p)";
Creation::usage="Creation[a,p] \!\(\*SuperscriptBox[\(\:4ea7\:751f\:7b97\:7b26a\), \(\[Dagger]\)]\)(p)";


BField::usage="BField[S,x] \:6807\:91cf\:573a \n 
BField[V,{a},x] \:77e2\:91cf\:573a \n
BField[T,{a,b,...},x] \:5f20\:91cf\:573a ";
EMField::usage="EMField[a,x]\:7535\:78c1\:573a \!\(\*SubscriptBox[\(A\), \(a\)]\)(x)";
GField::usage="GField[{a,\[Mu]},x] \:80f6\:5b50\:573a \!\(\*SubsuperscriptBox[\(G\), \(\[Mu]\), \(a\)]\)(x)";
DField::usage="DField[e,a,x] \:72c4\:62c9\:514b\:573a \!\(\*SubscriptBox[\(e\), \(a\)]\)(x)";
QField::usage="QField[q,{i,a},x] \:5938\:514b\:573a \!\(\*SubsuperscriptBox[\(q\), \(a\), \(i\)]\)(x)";


BPropagator::usage="BPropagator[A,x] \:6807\:91cf\:73bb\:8272\:4f20\:64ad\:5b50 \!\(\*SubscriptBox[\(S\), \(A\)]\)(x) \n 
BPropagator[A,{a,b,...},x] \:5f20\:91cf\:73bb\:8272\:4f20\:64ad\:5b50 \!\(\*SubsuperscriptBox[\(S\), \(A\), \(ab ... \)]\)(x)";
DPropagator::usage="DPropagator[e,x] \:72c4\:62c9\:514b\:4f20\:64ad\:5b50 \!\(\*SubscriptBox[\(S\), \(e\)]\)(x)";
GPropagator::usage="GPropagator[{\[Mu],\[Nu]},x] \:80f6\:5b50\:4f20\:64ad\:5b50 \!\(\*SubsuperscriptBox[\(S\), \(g\), \(\[Mu]\[Nu]\)]\)(x)";
GeneralPropagator::usage="GeneralPropagator[x,FP,vars___] \:81ea\:5b9a\:4e49\:4f20\:64ad\:5b50";


DSpinor::usage="DSpinor[u,e,p] \:72c4\:62c9\:514b\:65cb\:91cf \!\(\*SubscriptBox[\(u\), \(e\)]\)(p)";


ChargeConjugate::usage="\:7535\:8377\:5171\:8f6d\:8fd0\:7b97";
WickContract::usage="\:7ef4\:514b\:6536\:7f29";
SMatrix::usage="SMatrix[L,N] \:7ed9\:5b9a\:62c9\:683c\:6717\:65e5L(x),\:7ed9\:51faS\:77e9\:9635\:7684N\:9636\:5fae\:6270";
CheckParticles::usage="CheckParticles[f,ParticleList]\:5982\:679c\:8868\:8fbe\:5f0ff\:542b\:6709\:7c92\:5b50\:5217\:8868ParticleList\:7684\:5168\:90e8\:7c92\:5b50,\:8f93\:51faf,\:5426\:5219\:8f93\:51fa0";


NCMatrixDot::usage="NCMatrixDot[A,B,...]\:975e\:5bf9\:6613\:7b97\:7b26\:77e9\:9635\:4e58\:79ef A**B**...";
NCMSimplify::usage="\:975e\:5bf9\:6613\:4e58\:79ef\:5316\:7b80";


(* ::Subsection:: *)
(*\:5fae\:5206\:79ef\:5206\:8fd0\:7b97*)


Partial::usage="Partial[x]\:4e00\:9636\:504f\:5fae\:5206\:7b97\:7b26 \!\(\*FractionBox[\(\[PartialD]\), \(\[PartialD]x\)]\) 
\n Partial[x,y,...]\:9ad8\:9636\:504f\:5fae\:5206\:7b97\:7b26 \!\(\*FractionBox[\(\[PartialD]\), \(\[PartialD]x\)]\)\!\(\*FractionBox[\(\[PartialD]\), \(\[PartialD]y\)]\)...";
PDSimplify::usage="\:504f\:5fae\:5206\:5316\:7b80\:8fd0\:7b97";


Int::usage=" Int[x,n] n\:7ef4\:5168\:7a7a\:95f4\:79ef\:5206\:7b97\:7b26 \[Integral]\!\(\*SuperscriptBox[\(d\), \(n\)]\)x
\n
Int[x,{a,b}] \:6709\:9650\:533a\:95f41\:7ef4\:79ef\:5206\:7b97\:7b26 \!\(\*SubsuperscriptBox[\(\[Integral]\), \(a\), \(b\)]\)dx
\n
Int[{x,y,...},n] n\:7ef4\:5168\:7a7a\:95f4\:79ef\:5206\:7b97\:7b26 \[Integral]\!\(\*SuperscriptBox[\(d\), \(n\)]\)x\[Integral]\!\(\*SuperscriptBox[\(d\), \(n\)]\)y... ";


InversePower::usage="InversePower[p,n]\:5012\:6570\:5e42 \!\(\*FractionBox[\(1\), SuperscriptBox[\(p\), \(n\)]]\)";
PropagatorFactor::usage="PropagatorFactor[{p,m,n}] \:52a8\:91cf\:7a7a\:95f4\:7684\:4f20\:64ad\:5b50 \n
PropagatorFactor[{{p1,m1,n1},{p2,m2,n2},...}] \:591a\:4e2a\:4f20\:64ad\:5b50\:4e58\:79ef";


SymbolRange::usage="SymbolRange[x,{m,n}] \:4ea7\:751f\:4e00\:7ec4\:53d8\:91cf {xm,...xn}"
CSquare::usage="CSquare[f,x] \:5bf92\:6b21\:51fd\:6570\:914d\:65b9 f=\!\(\*SuperscriptBox[\(ax\), \(2\)]\)+bx+c";

ExpInt::usage="\:6307\:6570\:51fd\:6570\:79ef\:5206";
DDelta::usage="DDelta[x] 1\:7ef4\:72c4\:62c9\:514b\:5fb3\:5854\:51fd\:6570 \[Delta](x)
\n
DDelta[x,n] n\:7ef4\:72c4\:62c9\:514b\:5fb3\:5854\:51fd\:6570 \!\(\*SuperscriptBox[\(\[Delta]\), \(n\)]\)(x)";
DeltaInt::usage="\:5fb3\:5854\:51fd\:6570\:79ef\:5206";
ShiftInt::usage="\:79ef\:5206\:5e73\:79fb";

SParameterize::usage="SParameterize[f] \:5bf9\:8868\:8fbe\:5f0ff\:8fdb\:884c\:65bd\:6e29\:683c\:53c2\:6570\:5316";
FParameterize::usage="FParameterize[f] \:5bf9\:8868\:8fbe\:5f0ff\:8fdb\:884c\:8d39\:66fc\:53c2\:6570\:5316";
FourierExpand::usage="\:5085\:91cc\:53f6\:5c55\:5f00";
PropagatorExpand::usage="\:52a8\:91cf\:7a7a\:95f4\:4f20\:64ad\:5b50\:5c55\:5f00";

Swap::usage="Swap[f,{x,y}] \:628a\:8868\:8fbe\:5f0ff\:7684\:53d8\:91cf x,y \:4e92\:6362
\n
Swap[f,{x1,y1},{x2,y2},...] \:628a\:8868\:8fbe\:5f0ff\:7684\:53d8\:91cf x1,y1; x2,y2... \:5206\:522b\:4e92\:6362
";


PolynomialSimplify::usage="PolynomialSimplify[f,{x,y,...}] \:4ee5x,y,...\:4e3a\:7cfb\:6570,\:628a\:4ee3\:6570\:591a\:9879\:5f0ff\:5316\:7b80";
GaussInt::usage="GaussInt[f,p] \:5bf9\:8868\:8fbe\:5f0ff\:8fdb\:884c\:9ad8\:65af\:79ef\:5206
\n
GaussInt[f,{p1,p2,...}] \:5bf9\:8868\:8fbe\:5f0ff\:8fdb\:884c\:9ad8\:65af\:79ef\:5206";


(* ::Section:: *)
(*\:5f00\:59cb*)


Begin["`Private`"]


(* ::Section:: *)
(*\:72c4\:62c9\:514b\:77e9\:9635\:4ee3\:6570*)


(* ::Subsection:: *)
(*\:7b26\:53f7\:5b9a\:4e49*)


Format[DGamma[a_],TraditionalForm]:=
 DisplayForm[ 
SuperscriptBox["\[Gamma]",a]
];
Format[DGamma5,TraditionalForm]:=
 DisplayForm[ 
SuperscriptBox["\[Gamma]",5]
];


Format[DTrace,TraditionalForm]:=
 DisplayForm[ 
"tr"
];


Format[CCM,TraditionalForm]:=
 DisplayForm[ 
"C"
];


Format[SU3T[a_],TraditionalForm]:=
 DisplayForm[ 
SuperscriptBox["T",a]
];


Format[MatrixElement[A_,a_],TraditionalForm]:=
 DisplayForm[ 
 RowBox[{
 "[",A,"",SubscriptBox["]", RowBox[a]]
 }]
 ];


Format[SuperT[A_],TraditionalForm]:=
 DisplayForm[ 
  RowBox[{
 "[",A,"",SuperscriptBox["]","T"]
}]
];


Format[FSlash[p_],TraditionalForm]:=
 DisplayForm[ 
Overlay[{p,Style["/",Red]},Alignment->Center]
];


Format[Sigma[a_,b_],TraditionalForm]:=
 DisplayForm[ 
 SuperscriptBox["\[Sigma]", RowBox[{a,b}]]
];


(* ::Subsection:: *)
(*\:7b26\:53f7\:903b\:8f91*)


FSlash[p_+k_]:=FSlash[p]+FSlash[k];
FSlash[-p_]:=-FSlash[p];


GammaQ[f_]:=FreeQ[f,DGamma[__]|FSlash[_]|DGamma5|CCM|DSpinor[__]|DPropagator[__]];


DGamma[x__]:=Dot@@DGamma/@{x}/;Length[{x}]>1;


DotSimplify[f_]:=f//.{
Dot[SuperT[CCM],SuperT@DPropagator[A_,x_],CCM]:>DPropagator[A,-x],
Dot[SuperT[CCM],SuperT@DGamma[a_],CCM]:>-DGamma[a],
Dot[SuperT[CCM],DGamma5,CCM]:>DGamma5,
Dot[CCM,DGamma5,SuperT[CCM]]:>DGamma5,
Dot[CCM,SuperT[CCM]]->1,
Dot[SuperT[CCM],CCM]->1,
Dot[CCM,CCM]->-1,

SuperDagger[Dot[A_,B_]]:>SuperDagger[B] . SuperDagger[A],
SuperDagger[DGamma[a_]]:>DGamma[0] . DGamma[a] . DGamma[0],
SuperDagger[DGamma5]:>DGamma5,
SuperDagger[FSlash[p_]]:>DGamma[0] . FSlash[p] . DGamma[0],
Dot[DGamma[0],DGamma[0]]:>1,

Dot[D___,A_+B_,C___]:>Dot[D,A,C]+Dot[D,B,C],
Dot[A___,k_?GammaQ,B___]:>k*Dot[A,B],
Dot[A___,k_?GammaQ*C_,B___]:>k*Dot[A,C,B],

DGamma[a_,a_]:>4,
Dot[FSlash[p_],FSlash[p_]]:>SDot[p,p],
Dot[FSlash[p_],DSpinor["u",e_,p_]]:>Mass[e]*DSpinor["u",e,p],
Dot[DSpinor[OverBar["u"],e_,p_],FSlash[p_]]:>Mass[e]*DSpinor[OverBar["u"],e,p],

Dot[DGamma[a_],DGamma[b_],A___,DGamma[a_]]:>2Dot[A,DGamma[b]]-Dot[DGamma[b],DGamma[a],A,DGamma[a]],
Dot[DGamma[a_],FSlash[p_],A___,DGamma[a_]]:>2Dot[A,FSlash[p]]-Dot[FSlash[p],DGamma[a],A,DGamma[a]],
Dot[FSlash[p_],DGamma[b_],A___,FSlash[p_]]:>2FVector[p,b]*Dot[A,FSlash[p]]-Dot[DGamma[b],FSlash[p],A,FSlash[p]],
Dot[FSlash[p_],FSlash[k_],A___,FSlash[p_]]:>2SDot[p,k]*Dot[A,FSlash[p]]-Dot[FSlash[k],FSlash[p],A,FSlash[p]],

Dot[FSlash[p_],DGamma[b_],A___,DSpinor["u",e_,p_]]:>2FVector[p,b]*Dot[A,DSpinor["u",e,p]]-Dot[DGamma[b],FSlash[p],A,DSpinor["u",e,p]],
Dot[FSlash[p_],FSlash[k_],A___,DSpinor["u",e_,p_]]:>2SDot[p,k]*Dot[A,DSpinor["u",e,p]]-Dot[FSlash[k],FSlash[p],A,DSpinor["u",e,p]],
Dot[DSpinor[OverBar["u"],e_,p_],A___,DGamma[b_],FSlash[p_]]:>
2FVector[p,b]*Dot[DSpinor[OverBar["u"],e,p],A]-Dot[DSpinor[OverBar["u"],e,p],A,FSlash[p],DGamma[b]],
Dot[DSpinor[OverBar["u"],e_,p_],A___,FSlash[k_],FSlash[p_]]:>
2SDot[p,k]*Dot[DSpinor[OverBar["u"],e,p],A]-Dot[DSpinor[OverBar["u"],e,p],A,FSlash[p],FSlash[k]],

k_.*DGamma[a_,b_]+k_.*DGamma[b_,a_]:>2k*MTensor[a,b],
k_.*Dot[DGamma[a_],FSlash[p_]]+k_.*Dot[FSlash[p_],DGamma[a_]]:>2k*FVector[p,a],
k_.*Dot[FSlash[q_],FSlash[p_]]+k_.*Dot[FSlash[p_],FSlash[q_]]:>2k*SDot[p,q],


Dot[DGamma5,DGamma5]:>1,
Dot[DGamma5,DGamma[a_]]:>-DGamma[a] . DGamma5,
Dot[DGamma5,FSlash[p_]]:>-FSlash[p] . DGamma5
};


RotateTrace[f_]:=f/.{
DTrace[HoldPattern[Dot[A__]]]:>Module[
{N,B},
N=Ordering[{A}][[1]]-1;
B=RotateLeft[{A},N];
DTrace[Dot@@B]
]};


TrSimplify[f_]:=Module[
{G,H,J,K,L},
G=DotSimplify[f];
H=G/.{DTrace[Dot[A__] . DGamma5]:>Module[
{N,B},
N=Ordering[{A}][[1]]-1;
B=RotateLeft[{A},N];
(-1)^N*DTrace[Dot@@B . DGamma5]
]};
J=DotSimplify[H/.{FSlash->UCFSlash}];
K=J/.{DGamma[a_]:>DGamma[{a}]}//.{Dot[DGamma[a_],DGamma[b_]]:>DGamma[Join[a,b]]};
L=K//.{
DTrace[x_?GammaQ]:>4*x,
DTrace[x_?GammaQ*A_]:>x*DTrace[A],
DTrace[x_+y_]:>DTrace[x]+DTrace[y],

DTrace[DGamma[A_List]]:>0/;OddQ[Length[A]],
DTrace[DGamma[{x_,y_}]]:>4*MTensor[x,y],
DTrace[DGamma[A_List]]:>Module[
{N,T,i},
N=Length[A];
T[j_]:=Delete[A, {{1},{j}}];
Sum[(-1)^i*MTensor[A[[1]],A[[i]]]*DTrace[DGamma[T[i]]],{i,2,N}]
]/;EvenQ[Length[A]]&&Length[A]>2,

DTrace[DGamma5]:>0,
DTrace[Dot[DGamma[A_List],DGamma5]]:>0/;OddQ[Length[A]],
DTrace[DGamma[{x_,y_}] . DGamma5]:>0,
DTrace[DGamma[{a_,b_,c_,d_}] . DGamma5]:>-4*I*Epsilon4[a,b,c,d],
DTrace[DGamma[A_List] . DGamma5]:>
Module[
{A1,A2,A3,A12,A23,A13,A123,b,B},
A1=A[[1]];A2=A[[2]];A3=A[[3]];
A13=Delete[A,{{1},{3}}];A12=Drop[A,{1,2}];
A23=Drop[A,{2,3}];A123=Drop[A,3];B=Flatten[{b,A123}];
MTensor[A1,A2]*DTrace[DGamma[A12] . DGamma5]-MTensor[A1,A3]*DTrace[DGamma[A13] . DGamma5]+
MTensor[A3,A2]*DTrace[DGamma[A23] . DGamma5]-I*Epsilon4[A1,A2,A3,b]*DTrace[DGamma[B]]
]/;EvenQ[Length[A]]&&Length[A]>4
};
L//LContract
];


MContract[f_]:=
f//.{
MatrixElement[A_,{a_,b_}]*MatrixElement[B_,{b_,c_}]:>MatrixElement[A . B,{a,c}],
MatrixElement[C_,{a_}]*MatrixElement[A_,{a_,b_}]*MatrixElement[B_,{b_}]:>C . A . B,
MatrixElement[A_,{a_,b_}]*MatrixElement[B_,{a_,c_}]:>MatrixElement[SuperT[A] . B,{b,c}],
MatrixElement[A_,{a_,b_}]*MatrixElement[B_,{c_,b_}]:>MatrixElement[A . SuperT[B],{a,c}],
MatrixElement[A_,{a_,a_}]:>DTrace[A]
};


ComplexConjugate[f_]:=f/.{
Complex[0,a_]:>Complex[0,-a],
Dot[DSpinor[OverBar[u_],t__],A__,DSpinor[v_,r__]]:>Dot[DSpinor[OverBar[v],r],DGamma[0],SuperDagger[Dot[A]],DGamma[0],DSpinor[u,t]],
Conjugate[x_]:>x,PolarVector[x__]:>Conjugate[PolarVector[x]]
}//DotSimplify;


DSpinorTraceCycle[f_]:=f//.{
Dot[A__,DSpinor[u_,k__]]*Dot[DSpinor[OverBar[u_],k__],B__]
:>Dot[A,DSpinor[u,k],DSpinor[OverBar[u],k],B]
}/.{
Dot[DSpinor[OverBar[u_],k__],B__,DSpinor[u_,k__]]
:>DTrace[Dot[B,DSpinor[u,k],DSpinor[OverBar[u],k]]]};


PolarSum[f_]:=f//.{
PolarVector["\[Gamma]",{a_},p_]*Conjugate[PolarVector["\[Gamma]",{b_},p_]]:>-MTensor[a,b],
PolarVector[A_,{a_},p_]*Conjugate[PolarVector[A_,{b_},p_]]:>-GTensor[{a,b},p,A],
PolarVector[A_,{a_,b_},p_]*Conjugate[PolarVector[A_,{c_,d_},p_]]:>1/2*(GTensor[{a,c},p,A]*GTensor[{b,d},p,A]+
GTensor[{b,c},p,A]*GTensor[{a,d},p,A])-1/3*GTensor[{a,b},p,A]*GTensor[{c,d},p,A],
DSpinor["u",A_,p_] . DSpinor[OverBar["u"],A_,p_]:>FSlash[p]+Mass[A],
DSpinor["v",A_,p_] . DSpinor[OverBar["v"],A_,p_]:>FSlash[p]-Mass[A]
};


MTranspose[f_]:=f//.{
SuperT[Dot[A_,B_]]:>
SuperT[B] . SuperT[A],
SuperT[k_?GammaQ*A_]:>k*SuperT[A]
}/.{SuperT@SuperT@x_:>x}/.{
SuperT[DGamma[0]]->DGamma[0],
SuperT[DGamma5]->DGamma5,
SuperT[CCM]->-CCM
};


(* ::Section:: *)
(*\:5f20\:91cf\:4ee3\:6570*)


(* ::Subsection:: *)
(*\:7b26\:53f7\:5b9a\:4e49*)


Format[Tensor[T_,{i__},{j__},n_],TraditionalForm]:=DisplayForm[ 
SubsuperscriptBox[T,RowBox[{j}],RowBox[{i}]]
];


Format[UTensor[T_,{i__},n_],TraditionalForm]:=DisplayForm[ 
SuperscriptBox[T,RowBox[{i}]]
];


Format[SUTensor[T_,{i__},n_],TraditionalForm]:=DisplayForm[ 
SuperscriptBox[T,RowBox[{i}]]
];


Format[AUTensor[T_,{i__},n_],TraditionalForm]:=DisplayForm[ 
SuperscriptBox[T,RowBox[{i}]]
];


Format[DTensor[T_,{i__},n_],TraditionalForm]:=DisplayForm[ 
SubscriptBox[T,RowBox[{i}]]
];


Format[PolarVector[V_,{a__},p_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
SubsuperscriptBox["\[CurlyEpsilon]",RowBox[{a}],V],"(",p,")"
}]
];


Format[SDot[p_,p_],TraditionalForm]:=
 DisplayForm[ 
SuperscriptBox[p,2]
];
Format[SDot[p_,k_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{"(",p,"\[CenterDot]",k,")"}]
];


(* ::Subsection:: *)
(*\:7b26\:53f7\:903b\:8f91*)


SetAttributes[SDot,Orderless];
SUTensor[T_,a_,n_]:=SUTensor[T,Sort[a],n]/;!OrderedQ[a];
AUTensor[T_,a_,n_]:=Signature[a]*AUTensor[T,Sort[a],n]/;!OrderedQ[a];
AUTensor[T_,a_,n_]:=0/;!DuplicateFreeQ[a];


FVector[p_,a_]:=UTensor[p,{a},4];
MTensor[a_,b_]:=SUTensor["g",{a,b},4];
KDelta[a_,n_]:=SUTensor["\[Delta]",a,n];
Epsilon3[a__]:=AUTensor["\[Epsilon]",{a},3];
Epsilon4[a__]:=AUTensor["\[Epsilon]",{a},4];
SU3F[a__]:=AUTensor["f",{a},8];


SDot[x_+y_,a_]:=SDot[x,a]+SDot[y,a];
SDot[-x_,a_]:=-SDot[x,a];


UTensor[x_+y_,a_,N_]:=UTensor[x,a,N]+UTensor[y,a,N];
UTensor[-x_,a_,N_]:=-UTensor[x,a,N];


TContract[f_]:=Module[
{F},
f//Expand//CheckDummyIndices;
F=Expand[f]//.{AUTensor["\[Epsilon]",a_,3]*AUTensor["\[Epsilon]",b_,3]:>Module[
{T}, 
 T = Table[KDelta[{a[[i]], b[[j]]},3], {i, 3}, {j, 3}]; 
 Det[T]
]};

Expand[F]//.{
Epsilon3[a__]^2:>6,
KDelta[{a_,b_},n_]^2:>n,
KDelta[{a_,a_},n_]:>n,

H_[A_,{c___,a_,e___},n_]*KDelta[{a_,b_},n_]:>H[A,{c,b,e},n]/;MemberQ[{UTensor,SUTensor,AUTensor},H],
H_[A_,{c___,b_,e___},n_]*KDelta[{a_,b_},n_]:>H[A,{c,a,e},n]/;MemberQ[{UTensor,SUTensor,AUTensor},H]
}
];


SchoutenIdentity[h_]:=h//.{
Epsilon4[a_,b_,c_,d_]*f_+Epsilon4[e_,b_,c_,d_]*g_:>Swap[Epsilon4[a,b,c,d]*f,{b,e}]+
Swap[Epsilon4[a,b,c,d]*f,{c,e}]+Swap[Epsilon4[a,b,c,d]*f,{d,e}]/;Simplify[g===(-f/.e->a)]};


SchoutenSimplfy[f_]:=FixedPoint[SchoutenIdentity,f];


LContract[f_]:=Module[
{F,G,K},
f//Expand//CheckDummyIndices;
F=Expand[f]//.{
AUTensor["\[Epsilon]",a_,4]*AUTensor["\[Epsilon]",b_,4]:>Module[
{ T}, 
 T = Table[MTensor[a[[i]], b[[j]]], {i, 4}, {j, 4}]; 
 -Det[T]
]};

G=Expand[F]//.{
MTensor[a_,b_]^2:>4,
MTensor[a_,a_]:>4,

H_[A_,{c___,a_,e___},4]*MTensor[a_,b_]:>H[A,{c,b,e},4]/;MemberQ[{UTensor,SUTensor,AUTensor},H],
H_[A_,{c___,b_,e___},4]*MTensor[a_,b_]:>H[A,{c,a,e},4]/;MemberQ[{UTensor,SUTensor,AUTensor},H],

Dot[A___,DGamma[c_],B___]*MTensor[a_,c_]:>Dot[A,DGamma[a],B],
Dot[A___,DGamma[a_],B___]*MTensor[a_,c_]:>Dot[A,DGamma[c],B]
};

K=G//.{
Epsilon4[a__]^2:>-24,

Epsilon4[a___,b_,c___]*FVector[p_,b_]:>Epsilon4[a,FV[p],c],

1/UTensor[A_,{a_},4]/UTensor[B_,{a_},4]:>1/SDot[A,B],
UTensor[A_,{a_},4]*UTensor[B_,{a_},4]:>SDot[A,B],
UTensor[A_,{a_},4]^2:>SDot[A,A],
FVector[k_,b_]*DGamma[b_]:>FSlash[k]
};
K
];


UCSDot[A_,B_]:=Module[
{a},
a=UniqueIndex["SD"];
UTensor[A,{a},4]*UTensor[B,{a},4]
];
UCEpsilon4[a___,FV[p_],e___]:=Module[
{x},
x=UniqueIndex["EP"];
If[
FreeQ[{a,e},FV],
Epsilon4[a,x,e]*FVector[p,x],
UCEpsilon4[a,x,e]*FVector[p,x]
]
];
UCFSlash[p_]:=Module[
{a},
a=UniqueIndex["FS"];
FVector[p,a]*DGamma[a]
];


UnContract[f_]:=Module[
{T,F,G},
F=f/.{
x_^n_Integer:>1/T@@Table[x,-n]/;n<-1,
x_^n_Integer:>T@@Table[x,n]/;n>1
};
G=F/.Thread[{SDot,FSlash,AUTensor["\[Epsilon]",{a__},4]}:>{UCSDot,UCFSlash,UCEpsilon4[a]}];
G/.{T->Times}
];


IndexCounter=0;
UniqueIndex[a_]:=Module[
{F,B,Id,C},
IndexCounter=IndexCounter+1;
Id=ToString[IndexCounter];
B=ToExpression[ToString[a]<>Id];
F[x_]:=ToString[x]<>Id;
C=ToExpression[F/@a];
If[ListQ[a],C,B]
];
UniqueIndex[x_,n_Integer]:=UniqueIndex/@Table[x,n]


SymbolRange[k_,{i_,j_}]:=Table[Symbol[ToString[k]<>ToString[n]],{n,i,j}];


CheckDummyIndices[f_/;Head[Expand[f]]===Plus]:=Module[
{F,IndexList},
F=List@@Expand[f];
IndexList=CheckDummyIndices/@F;
DeleteDuplicates[IndexList]
];


CheckDummyIndices[f_/;Head[Expand[f]]=!=Plus]:=Module[
{rule,IntIndex,AllIndex,DummyIndex},
rule=Alternatives[
MatrixElement[_,a_],
DGamma[a_],
DField[_,a_,_],
QField[_,a_,_],
BField[_,a_,_],
GField[a_,_],
PolarVector[_,a_,_],
UTensor[_,a_,_],
SUTensor[_,a_,_],
AUTensor[_,a_,_],
SU3T[a_]
]:>a;
IntIndex=Cases[f,Int[a_,_],All]//Flatten;
AllIndex=Cases[f,rule,All]//Flatten;
DummyIndex=Cases[Gather[AllIndex],{x_,x_}:>x];
If[
Max[Counts[AllIndex]]>2,
Message[General::DummyIndex];Return[$Failed], 
Join[DummyIndex,IntIndex]
 ]
 ];


RenameDummyIndices[f_/;Head[Expand[f]]===Plus]:=Module[
{F},
 F=List@@Expand[f];
Plus@@RenameDummyIndices/@F
];


RenameDummyIndices[f_/;Head[Expand[f]]=!=Plus]:=Module[
{IndexList,FixedIndex,N},
  IndexList=CheckDummyIndices[f];
   N=Length[IndexList];
  FixedIndex=SymbolRange["RN",{1,N}];
f/.Thread[IndexList->FixedIndex]
];


RefreshDummyIndices[f_]:=Module[
{IndexList,FreshIndex},
  IndexList=CheckDummyIndices[f]//Flatten;
  FreshIndex=UniqueIndex[IndexList];
   f//.Thread[IndexList->FreshIndex]
];


OnShellSimplify[f_,Particle_List]:=Module[
{repRules,pe,e},
repRules=Join[
Table[{SDot[pe,pe]:>Mass[e]^2}/. {pe->pair[[2]],e->pair[[1]]},
{pair,Particle}],
{Mass["\[Gamma]"]->0}]//Flatten;
f//.repRules];


KinematicSimplify[f_,InMomentum_List,OutMomentum_List,FreeSDot_List]:=Module[
{MomentumList,EquationList,AllSDotList,VariableList,SolveList,repRules},
MomentumList=Join[InMomentum,OutMomentum];
EquationList=Table[SDot[Total[InMomentum],pi]==SDot[Total[OutMomentum],pi],{pi,MomentumList}];
AllSDotList=SDot@@@Subsets[MomentumList,{2}];
VariableList=Complement[AllSDotList,FreeSDot];
SolveList=Solve[And@@EquationList,VariableList];
If[
SolveList==={},
Message[General::NoSolution];Return[$Failed],
repRules=SolveList[[1]]
];
f//.repRules];


(* ::Section:: *)
(*\:7b97\:7b26\:4ee3\:6570*)


(* ::Subsection:: *)
(*\:7b26\:53f7\:5b9a\:4e49*)


Format[Mass[x_],TraditionalForm]:=
 DisplayForm[ 
SubscriptBox["m",x]
];


Format[FV[p_],TraditionalForm]:=
 DisplayForm[ 
p
];


Format[ChargedParticle[A_,Q_],TraditionalForm]:=
 DisplayForm[ 
SuperscriptBox[A,CTS[Q]]
];


Format[BState[{A_,p_}],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
A,"(",p,")"
}]
];


Format[FState[{A_,p_}],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
A,"(",p,")"
}]
];


Format[Annihilation[a_,p_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
a,"(",p,")"
}]
];


Format[BField[B_,x_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
B,"(",x,")"
}]
];


Format[BField[B_,{a__},x_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
SubscriptBox[B,RowBox[{a}]],"(",x,")"
}]
];


Format[DField[A_,a_,x_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
SubscriptBox[A,a],"(",x,")"
}]
];


Format[QField[A_,{i_,a_},x_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
SubsuperscriptBox[A,a,i],"(",x,")"
}]
];


Format[GField[{a_,\[Mu]_},x_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
SubsuperscriptBox["G",\[Mu],a],"(",x,")"
}]
];


Format[DSpinor[u_,A_,p_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
SubscriptBox[u,A],"(",p,")"
}]
];


Format[BPropagator[A_,x_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
SubscriptBox["S",A],"(",x,")"
}]
];


Format[BPropagator[A_,{a__},x_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
SubsuperscriptBox["S",A,RowBox[{a}]],"(",x,")"
}]
];


Format[DPropagator[A_,x_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
SubscriptBox["S",A],"(",x,")"
}]
];


Format[GPropagator[{\[Mu]_,\[Nu]_},x_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
SubsuperscriptBox["S","g",RowBox[{\[Mu],\[Nu]}]],"(",x,")"
}]
];


(* ::Subsection:: *)
(*\:7b26\:53f7\:903b\:8f91*)


CTS[x_]:=Piecewise[{{"+",x==1},{"-",x==-1},{0,x==0}},Undefined];


Creation[x__]:=SuperDagger[Annihilation[x]];


EMField[a_,x_]:=BField["A",{a},x];
FState[A__]:=FState/@{A}/;Length[{A}]>1;
BState[A__]:=BState/@{A}/;Length[{A}]>1;
Bra[A_]:=NonCommutativeMultiply@@Bra/@List/@A/;Length[A]>1;
Ket[A_]:=NonCommutativeMultiply@@Ket/@List/@A/;Length[A]>1;


NewOperatorList={};


OperatorQ[f_]:=Module[
{DefaultOperatorList,pat},
DefaultOperatorList={BField[__],DField[__],QField[__],GField[__],Ket[_],Bra[_],Annihilation[__],Creation[__]};
pat=Alternatives@@Join[DefaultOperatorList,NewOperatorList];
FreeQ[f,pat]
];


NCMatrixDot[A_,B_]:=Table[Sum[A[[i,k]]**B[[k,j]],{k,Length[A[[1]]]}],{i,Length[A]},{j,Length[B[[1]]]}];
NCMatrixDot[A__]:=Fold[NCMatrixDot,{A}]/;Length[{A}]>2;


NCMSimplify[f_]:=f//.{
0**a_:>0,a_**0:>0,
(A_+B_)**C_:>A**C+B**C,
A_**(C_+B_):>A**C+A**B,
(k_?OperatorQ*A_)**B_:>k*A**B,
B_**(k_?OperatorQ*A_):>k*B**A,
k_?OperatorQ**B_:>k*B,
B_**k_?OperatorQ:>k*B
};


ChargeConjugate[f_]:=f/.{
ChargedParticle[A_,q_]:>ChargedParticle[A,-q]/;q!=0
};


SMatrix[l_,n_]:=Module[
{L},
L[y_]:=I*Int[y,4]*l[y];
If[n==1,L[ToExpression["x"]],
NonCommutativeMultiply@@Table[L[UniqueIndex["x"]],n]/n!]
];


IncludeAll[f_,PatternList_]:=Module[{F},
F[pat_]:=FreeQ[f,pat];
AnyTrue[PatternList,F]
];


CheckParticles[f_+g_,ParticleList_]:=CheckParticles[f,ParticleList]+CheckParticles[g,ParticleList];
CheckParticles[f_,ParticleList_]:=If[IncludeAll[f,ParticleList],0,f];


WickContract[f_]:=f/.{NonCommutativeMultiply->Wick
}//.{
Wick[HoldPattern[Ket[A_]],HoldPattern[Ket[B_]]]:>0,
Wick[HoldPattern[Bra[A_]],HoldPattern[Bra[B_]]]:>0,

Wick[BField[A_,x_],BField[B_,y_]]:>If[ChargeConjugate[A]===B,BPropagator[A,x-y],0],
Wick[BField["A",{a_},x_],BField["A",{b_},y_]]:>BPropagator["\[Gamma]",x-y]*MTensor[a,b],
Wick[BField[A_,{a__},x_],BField[B_,{b__},y_]]:>If[ChargeConjugate[A]===B,BPropagator[A,{a,b},x-y],0],
Wick[GField[{a_,\[Mu]_},x_],GField[{b_,\[Nu]_},y_]]:>GPropagator[{\[Mu],\[Nu]},x-y]*KDelta[{a,b},3],
Wick[DField[A_,a_,x_],DField[B_,b_,y_]]:>Piecewise[
{
{MatrixElement[DPropagator[A,x-y],{a,b}],B===OverBar[A]},
{-MatrixElement[DPropagator[B,y-x],{b,a}],A===OverBar[B]}
},
0
],
Wick[QField[A_,{i_,a_},x_],QField[B_,{j_,b_},y_]]:>Piecewise[
{
{MatrixElement[DPropagator[A,x-y],{a,b}]*KDelta[{i,j},3],B===OverBar[A]},
{-MatrixElement[DPropagator[B,y-x],{b,a}]*KDelta[{i,j},3],A===OverBar[B]}
},
0
],



Wick[BField[A_,x_],Ket[{BState[{A_,p_}]}]]:>Exp[-I*p*x],
Wick[Bra[{BState[{A_,p_}]}],BField[B_,x_]]:>Exp[I*p*x]/;ChargeConjugate[A]===B,

Wick[BField["A",{a_},x_],Ket[{BState[{"\[Gamma]",p_}]}]]:>Exp[-I*p*x]*PolarVector["\[Gamma]",{a},p],
Wick[Bra[{BState[{"\[Gamma]",p_}]}],BField["A",{a_},x_]]:>Exp[I*p*x]*Conjugate[PolarVector["\[Gamma]",{a},p]],

Wick[BField[A_,{a__},x_],Ket[{BState[{A_,p_}]}]]:>Exp[-I*p*x]*PolarVector[A,{a},p],
Wick[Bra[{BState[{A_,p_}]}],BField[B_,{a__},x_]]:>Exp[I*p*x]*Conjugate[PolarVector[A,{a},p]]/;ChargeConjugate[A]===B,


Wick[DField[OverBar[A_],a_,x_],Ket[{FState[{OverBar[A_],p_}]}]]:>Exp[-I*p*x]*MatrixElement[DSpinor[OverBar["v"],A,p],{a}],
Wick[DField[A_,a_,x_],Ket[{FState[{A_,p_}]}]]:>Exp[-I*p*x]*MatrixElement[DSpinor["u",A,p],{a}],
Wick[Bra[{FState[{A_,p_}]}],DField[OverBar[A_],a_,x_]]:>Exp[I*p*x]*MatrixElement[DSpinor[OverBar["u"],A,p],{a}],
Wick[Bra[{FState[{OverBar[A_],p_}]}],DField[A_,a_,x_]]:>Exp[I*p*x]*MatrixElement[DSpinor["v",A,p],{a}],


Wick[A_,Partial[x_][B_]]:>Partial[x][Wick[A,B]],
Wick[Partial[x_][B_],A_]:>Partial[x][Wick[B,A]],

Wick[A__]:>
Module[
{D,N,pat,FermionList,BosonList,q,w},
D={A};
N=Length[D];
q=BField[__]|GField[__]|Ket[{BState[__]}]|Bra[{BState[__]}];
w=DField[__]|QField[__]|Ket[{FState[__]}]|Bra[{FState[__]}];
FermionList=Cases[D,w];
BosonList=Cases[D,q];
Piecewise[{
{Sum[(-1)^j*Wick[D[[1]],D[[j]]]*Wick@@Delete[D,{{1},{j}}],{j,2,N}],BosonList==={}},
{Sum[Wick[D[[1]],D[[j]]]*Wick@@Delete[D,{{1},{j}}],{j,2,N}],FermionList==={}}
},
Wick@@FermionList*Wick@@BosonList
]
]/;Length[{A}]>2
}//.{Wick[A_,B_]:>0/;Head[A]=!=Head[B]};


(* ::Section:: *)
(*\:5fae\:5206\:79ef\:5206\:8fd0\:7b97*)


(* ::Subsection:: *)
(*\:7b26\:53f7\:5b9a\:4e49*)


Format[Partial[x_],TraditionalForm]:=
 DisplayForm[ 
FractionBox["\[PartialD]",RowBox[{"\[PartialD]",x}]]
];


Format[Partial[x__],TraditionalForm]:=
 DisplayForm[ 
FractionBox[SuperscriptBox["\[PartialD]",Length[{x}]],RowBox[Join[{"\[PartialD]"},Riffle[{x},"\[PartialD]"]]]]
]/;Length[{x}]>1;


Format[Int[x_,n_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
"\[Integral]",SuperscriptBox["d",n],x
}]
];
Format[Int[x_,{a_,b_}],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
SubsuperscriptBox["\[Integral]",a,b],"d",x
}]
];


Format[DDelta[x_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
"\[Delta]","(",x,")"
}]
];


Format[DDelta[x_,n_],TraditionalForm]:=
 DisplayForm[ 
RowBox[{
SuperscriptBox["\[Delta]",n],"(",x,")"
}]
];


Format[InversePower[x_,n_],TraditionalForm]:=
 DisplayForm[ 
FractionBox[1,x^n]
];


(* ::Subsection:: *)
(*\:7b26\:53f7\:903b\:8f91*)


PDSimplify[h_]:=h/.{
Partial[x__]:>Composition@@Partial/@{x}/;Length[{x}]>1
}//.{
Partial[FVector[p_,a_]][FVector[p_,b_]] :>MTensor[a,b],
Partial[FVector[p_,a_]][SDot[p_,p_]] :>2*FVector[p,a],
Partial[FVector[p_,a_]][SDot[p_,k_]] :>FVector[k,a],
Partial[FVector[p_,a_]][c_]:>0/;FreeQ[c,p],

Partial[x_][f_+g_]:>Partial[x][f]+Partial[x][g],
Partial[x_][f_*g_] :> Partial[x][f]*g + f*Partial[x][g],

Partial[x_][Exp[f_]] :> Partial[x][f]*Exp[f],
Partial[x_][f_^n_] :> n*f^(n-1)*Partial[x][f]
};


DDelta[x_,n_]:=DDelta[-x,n]/;Order[x,-x]==1;
BPropagator["\[Gamma]",x_]:=BPropagator["\[Gamma]",-x]/;Order[x,-x]==1;


Int[x_List,n_]:=Module[
{F},
F[y_]:=Int[y,n];
Times@@F/@x
];


GeneralPropagator[x_,FP_,vars___] := Module[{A},
  A[k_,y___] := Int[k,4]/(2Pi)^4 *FP[y,k]*Exp[-I*k*x];
  A[UniqueIndex["FP"],vars] 
];


FourierExpand[f_]:=f/.{
BPropagator[A_,x_]:>GeneralPropagator[x,BPropagator,A],
BPropagator[A_,{a__},x_]:>GeneralPropagator[x,BPropagator,A,{a}],
GPropagator[{a__},x_]:>GeneralPropagator[x,GPropagator,{a}],
DPropagator[A_,x_]:>GeneralPropagator[x,DPropagator,A]
};


GTensor[{a_,b_},p_,X_]:=MTensor[a,b]-FVector[p,a]*FVector[p,b]/Mass[X]^2;


PropagatorExpand[f_]:=f/.{
BPropagator["\[Gamma]",k_]:>-I*PropagatorFactor[{k,0,1}],
BPropagator[A_,k_]:>I*PropagatorFactor[{k,Mass[A],1}],
BPropagator[A_,{a_,b_},k_]:>-I*GTensor[{a,b},k,A]*PropagatorFactor[{k,Mass[A],1}],
GPropagator[{a_,b_},k_]:>-I*MTensor[a,b]*PropagatorFactor[{k,0,1}],
DPropagator[A_,k_]:>I*(FSlash[k]+Mass[A])*PropagatorFactor[{k,Mass[A],1}]};


CSquare[f_,x_]:=Module[
{d,k,A,a,b,c},
A=CoefficientList[f,x];
a=Simplify@Together@A[[3]];
b=A[[2]];c=A[[1]];
d=c-b^2/(4a);
k=Simplify[b/(2a)];
a*(x+k)^2+d
];


CSquare[f_,x_List]:=Fold[CSquare,f,x]/;Length[x]>1;


ExpInt[f_,y_]:=Expand[f]/.{
Exp[g_]:>Exp[PolynomialSimplify[Expand[g],y]]
}/.{
Exp[a_*y+b_.]*Int[y,n_]*A_.:>If[FreeQ[A,y],(2Pi)^n*DDelta[a/I,n]*Exp[b]*A,Exp[a*y+b]*Int[y,n]*A]};


ExpInt[f_,x__]:=Fold[ExpInt,f,{x}]/;Length[{x}]>1;


ExpInt[f_]:=f//.{
Int[x__,n_]*Int[y__,n_]:>Int[x,y,n]
}/.{
Int[x__,n_]*g_:>ExpInt[g*Int[{x},n],x]
};


DeltaInt[f_,p_]:=f/.{DDelta[x_,n___]:>DDelta[Expand[x],n]
}/.{DDelta[x_,n_]^2:>DDelta[x,n]*DDelta[0,n]}/.{
Int[p,n_]*DDelta[-p+k_,n_]*g_.:>(g/.{p->k}),
Int[p,n_]*DDelta[p+k_,n_]*g_.:>(g/.{p->-k}),
Int[p,n_]*DDelta[-p+k_,n_]^m_*g_.:>(g/.{p->k}),
Int[p,n_]*DDelta[p+k_,n_]^m_*g_.:>(g/.{p->-k}),
Int[p,{a_,b_}]*DDelta[-p+y_]*g_.:>(g/.{p->y}),
Int[p,{a_,b_}]*DDelta[p+y_]*g_.:>(g/.{p->-y})
};


DeltaInt[f_,x_List]:=Fold[DeltaInt,f,x];


DeltaInt[f_]:=f//.{
Int[x__,n_]*Int[y__,n_]:>Int[x,y,n]
}/.{
Int[x__,n_]*g_:>DeltaInt[g*Int[{x},n],{x}]
};


FindPropagator[f_]/;Head[Expand[f]]=!=Plus:=Cases[f,DPropagator[_,p_+q_]|BPropagator[_,p_+q_]|GPropagator[_,p_+q_]:>p+q,All];


ShiftInt[f_+g_,p_]:=ShiftInt[f,p]+ShiftInt[g,p];
ShiftInt[f_,p_]/;Head[Expand[f]]=!=Plus:=Module[
{PropagatorList,Shift},
PropagatorList=FindPropagator[f];
Shift=Cases[PropagatorList,p+q_:>q,All];
If[
Shift==={},f,
f/.{Int[p,4]*g_:>Int[p,4]*(g/.{p->p-Shift[[1]]})}
]
];
ShiftInt[f_,p_List]/;Head[Expand[f]]=!=Plus:=Fold[ShiftInt,f,p];


PropagatorFactor[{p_,m_,n_}]:=InversePower[p^2-m^2,n];


PropagatorFactor[A__]:=Times@@PropagatorFactor/@{A};


FParameterize[f_]:=f/.{InversePower[X__]:>InversePower[{X}]}//.{InversePower[A__]*InversePower[B__]:>InversePower[A,B]}/.{
InversePower[{A_,n_},{B_,m_}]:>Module[
{x},x=UniqueIndex["x"];
Int[x,{0,1}]*InversePower[A*x+B*(1-x),n+m]*x^(n-1)*(1-x)^(m-1)*Gamma[n+m]/Gamma[n]/Gamma[m]],
InversePower[A__]:>Module[
{xList,N,n,D},
N=Length[{A}];
D={A}[[All, 1]];
n={A}[[All, 2]];
xList=UniqueIndex["x",N];
InversePower[xList . D,Total[n]]*Gamma[Total[n]]*DDelta[1-Total[xList]]*Product[xList[[i]]^(n[[i]]-1)*Int[xList[[i]],{0,1}]/Gamma[n[[i]]],{i,N}]
]
}


SParameterize[f_]:=f//.{
InversePower[x_,n_]:>
Module[
{u},
u=UniqueIndex["u"];
(-1)^n/Gamma[n]*u^(n-1)*Exp[x*u]*Int[u,{0,Infinity}]
]
};


Swap[f_,{a_,b_}]:=f/.{a->b,b->a};
Swap[f_,x__]:=Fold[Swap,f,{x}];


PolynomialSimplify[f_,x_]:=Module[
{CoefList,Coef},
CoefList=Cases[f,a_.*x :> a];
Coef=CoefList//Total//Together//Simplify;
f/.{Total[CoefList*x]->Coef*x}
];
PolynomialSimplify[f_,x_List]:=Fold[PolynomialSimplify,f,x];


GaussInt[f_,p_]:=f/.{Exp[x_]:>Exp@CSquare[x,p]
}//.{Int[p,4]*Exp[a_*p^2+b_]:>I*Pi^2/a^2*Exp[b],
Int[p,4]*Exp[a_*(p+k_)^2+b_]:>I*Pi^2/a^2*Exp[b]};


GaussInt[f_,x_List]:=Fold[GaussInt,f,x]/;Length[x]>1;


(* ::Section:: *)
(*\:7ed3\:675f*)


End[]


EndPackage[]
