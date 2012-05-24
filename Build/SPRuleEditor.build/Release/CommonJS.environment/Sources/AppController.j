@STATIC;1.0;I;21;Foundation/CPObject.jI;21;AppKit/CPScrollView.jI;27;AppKit/CPSegmentedControl.jI;21;AppKit/CPRuleEditor.ji;22;LPMultiLineTextField.ji;19;NibRuleController.jt;4249;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("AppKit/CPScrollView.j",NO);
objj_executeFile("AppKit/CPSegmentedControl.j",NO);
objj_executeFile("AppKit/CPRuleEditor.j",NO);
objj_executeFile("LPMultiLineTextField.j",YES);
objj_executeFile("NibRuleController.j",YES);
var _1=objj_allocateClassPair(CPObject,"AppController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("theWindow"),new objj_ivar("scrollView"),new objj_ivar("editor"),new objj_ivar("predicateField"),new objj_ivar("refreshButton"),new objj_ivar("autoRefreshButton"),new objj_ivar("rowHeightField"),new objj_ivar("bgView"),new objj_ivar("appView"),new objj_ivar("_autoRefresh")]);
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_3,_4,_5){
with(_3){
objj_msgSend(bgView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","777777"));
objj_msgSend(appView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","ededed"));
var _6=appView._DOMElement;
_6.style.borderRadius="10px";
_6.style.boxShadow="rgba(0, 0, 0, 0.5) 0px 0px 30px";
_6.style.mozBoxShadow="rgba(0, 0, 0, 0.5) 0px 0px 30px";
_6.style.webkitBoxShadow="rgba(0, 0, 0, 0.5) 0px 0px 30px";
_autoRefresh=(objj_msgSend(autoRefreshButton,"state")==CPOnState);
objj_msgSend(rowHeightField,"setStringValue:",objj_msgSend(editor,"rowHeight"));
objj_msgSend(editor,"addRow:",nil);
}
}),new objj_method(sel_getUid("awakeFromCib"),function(_7,_8){
with(_7){
objj_msgSend(theWindow,"setFullPlatformWindow:",YES);
objj_msgSend(CPScrollView,"setGlobalScrollerStyle:",CPScrollerStyleOverlay);
objj_msgSend(scrollView,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","ededed"));
objj_msgSend(objj_msgSend(theWindow,"contentView"),"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","ededed"));
var _9=objj_msgSend(objj_msgSend(NibRuleController,"alloc"),"initWithCibName:bundle:","NibRuleControllerViews",objj_msgSend(CPBundle,"mainBundle"));
objj_msgSend(_9,"view");
objj_msgSend(editor,"setDelegate:",_9);
objj_msgSend(predicateField,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(predicateField,"setEditable:",NO);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_7,sel_getUid("rowsDidChange:"),CPRuleEditorRowsDidChangeNotification,editor);
}
}),new objj_method(sel_getUid("refreshPredicate"),function(_a,_b){
with(_a){
objj_msgSend(editor,"reloadPredicate");
var _c=objj_msgSend(editor,"predicate");
var _d=objj_msgSend(_c,"predicateFormat");
objj_msgSend(predicateField,"setStringValue:",_d);
}
}),new objj_method(sel_getUid("rowsDidChange:"),function(_e,_f,_10){
with(_e){
if(_autoRefresh){
objj_msgSend(_e,"refreshPredicate");
}
}
}),new objj_method(sel_getUid("stateChanged:"),function(_11,_12,_13){
with(_11){
objj_msgSend(editor,"setEditable:",objj_msgSend(_13,"selectedSegment")==0);
}
}),new objj_method(sel_getUid("modeChanged:"),function(_14,_15,_16){
with(_14){
var _17=objj_msgSend(_16,"selectedSegment");
switch(_17){
case 0:
objj_msgSend(editor,"setNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(editor,"addRow:",nil);
break;
case 1:
objj_msgSend(editor,"setNestingMode:",CPRuleEditorNestingModeSimple);
objj_msgSend(editor,"addRow:",nil);
break;
case 2:
objj_msgSend(editor,"setNestingMode:",CPRuleEditorNestingModeList);
objj_msgSend(editor,"addRow:",nil);
break;
case 3:
objj_msgSend(editor,"setNestingMode:",CPRuleEditorNestingModeSingle);
objj_msgSend(editor,"addRow:",nil);
break;
}
}
}),new objj_method(sel_getUid("rowHeightChanged:"),function(_18,_19,_1a){
with(_18){
var _1b=objj_msgSend(objj_msgSend(_1a,"stringValue"),"floatValue");
objj_msgSend(editor,"setRowHeight:",_1b);
objj_msgSend(_1a,"setStringValue:",objj_msgSend(editor,"rowHeight"));
}
}),new objj_method(sel_getUid("autoRefreshClicked:"),function(_1c,_1d,_1e){
with(_1c){
if(objj_msgSend(_1e,"state")==CPOffState){
_autoRefresh=NO;
objj_msgSend(refreshButton,"setEnabled:",YES);
return;
}
_autoRefresh=YES;
objj_msgSend(refreshButton,"setEnabled:",NO);
objj_msgSend(_1c,"refreshPredicate");
}
}),new objj_method(sel_getUid("refreshClicked:"),function(_1f,_20,_21){
with(_1f){
objj_msgSend(_1f,"refreshPredicate");
}
})]);
