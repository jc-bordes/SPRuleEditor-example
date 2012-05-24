@STATIC;1.0;p;15;AppController.jt;4429;@STATIC;1.0;I;21;Foundation/CPObject.jI;21;AppKit/CPScrollView.jI;27;AppKit/CPSegmentedControl.jI;21;AppKit/CPRuleEditor.ji;22;LPMultiLineTextField.ji;19;NibRuleController.jt;4249;
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
p;22;LPMultiLineTextField.jt;9646;@STATIC;1.0;I;20;AppKit/CPTextField.jt;9602;
objj_executeFile("AppKit/CPTextField.j",NO);
var _1=nil;
var _2=objj_allocateClassPair(CPTextField,"LPMultiLineTextField"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("_DOMTextareaElement"),new objj_ivar("_stringValue"),new objj_ivar("_hideOverflow")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("_DOMTextareaElement"),function(_4,_5){
with(_4){
if(!_DOMTextareaElement){
_DOMTextareaElement=document.createElement("textarea");
_DOMTextareaElement.style.position="absolute";
_DOMTextareaElement.style.background="none";
_DOMTextareaElement.style.border="0";
_DOMTextareaElement.style.outline="0";
_DOMTextareaElement.style.zIndex="100";
_DOMTextareaElement.style.resize="none";
_DOMTextareaElement.style.padding="0";
_DOMTextareaElement.style.margin="0";
_DOMTextareaElement.onblur=function(){
objj_msgSend(objj_msgSend(_1,"window"),"makeFirstResponder:",nil);
_1=nil;
};
_4._DOMElement.appendChild(_DOMTextareaElement);
}
return _DOMTextareaElement;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_6,_7,_8){
with(_6){
if(_6=objj_msgSendSuper({receiver:_6,super_class:objj_getClass("LPMultiLineTextField").super_class},"initWithFrame:",_8)){
}
return _6;
}
}),new objj_method(sel_getUid("isScrollable"),function(_9,_a){
with(_9){
return !_hideOverflow;
}
}),new objj_method(sel_getUid("setScrollable:"),function(_b,_c,_d){
with(_b){
_hideOverflow=!_d;
}
}),new objj_method(sel_getUid("setEditable:"),function(_e,_f,_10){
with(_e){
objj_msgSend(_e,"_DOMTextareaElement").style.cursor=_10?"cursor":"default";
objj_msgSendSuper({receiver:_e,super_class:objj_getClass("LPMultiLineTextField").super_class},"setEditable:",_10);
}
}),new objj_method(sel_getUid("selectText:"),function(_11,_12,_13){
with(_11){
objj_msgSend(_11,"_DOMTextareaElement").select();
}
}),new objj_method(sel_getUid("layoutSubviews"),function(_14,_15){
with(_14){
objj_msgSendSuper({receiver:_14,super_class:objj_getClass("LPMultiLineTextField").super_class},"layoutSubviews");
var _16=objj_msgSend(_14,"layoutEphemeralSubviewNamed:positioned:relativeToEphemeralSubviewNamed:","content-view",CPWindowAbove,"bezel-view");
objj_msgSend(_16,"setHidden:",YES);
var _17=objj_msgSend(_14,"_DOMTextareaElement"),_18=objj_msgSend(_14,"currentValueForThemeAttribute:","content-inset"),_19=objj_msgSend(_14,"bounds");
_17.style.top=_18.top+"px";
_17.style.bottom=_18.bottom+"px";
_17.style.left=_18.left+"px";
_17.style.right=_18.right+"px";
_17.style.width=(CGRectGetWidth(_19)-_18.left-_18.right)+"px";
_17.style.height=(CGRectGetHeight(_19)-_18.top-_18.bottom)+"px";
_17.style.color=objj_msgSend(objj_msgSend(_14,"currentValueForThemeAttribute:","text-color"),"cssString");
_17.style.font=objj_msgSend(objj_msgSend(_14,"currentValueForThemeAttribute:","font"),"cssString");
switch(objj_msgSend(_14,"currentValueForThemeAttribute:","alignment")){
case CPLeftTextAlignment:
_17.style.textAlign="left";
break;
case CPJustifiedTextAlignment:
_17.style.textAlign="justify";
break;
case CPCenterTextAlignment:
_17.style.textAlign="center";
break;
case CPRightTextAlignment:
_17.style.textAlign="right";
break;
default:
_17.style.textAlign="left";
}
_17.value=_stringValue||"";
if(_hideOverflow){
_17.style.overflow="hidden";
}
}
}),new objj_method(sel_getUid("scrollWheel:"),function(_1a,_1b,_1c){
with(_1a){
var _1d=objj_msgSend(_1a,"_DOMTextareaElement");
_1d.scrollLeft+=_1c._deltaX;
_1d.scrollTop+=_1c._deltaY;
}
}),new objj_method(sel_getUid("mouseDown:"),function(_1e,_1f,_20){
with(_1e){
if(objj_msgSend(_1e,"isEditable")&&objj_msgSend(_1e,"isEnabled")){
objj_msgSend(objj_msgSend(objj_msgSend(_1e,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}else{
objj_msgSendSuper({receiver:_1e,super_class:objj_getClass("LPMultiLineTextField").super_class},"mouseDown:",_20);
}
}
}),new objj_method(sel_getUid("mouseDragged:"),function(_21,_22,_23){
with(_21){
return objj_msgSend(objj_msgSend(objj_msgSend(_23,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("keyUp:"),function(_24,_25,_26){
with(_24){
if(_stringValue!==objj_msgSend(_24,"stringValue")){
_stringValue=objj_msgSend(_24,"stringValue");
if(!_isEditing){
_isEditing=YES;
objj_msgSend(_24,"textDidBeginEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidBeginEditingNotification,_24,nil));
}
objj_msgSend(_24,"textDidChange:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidChangeNotification,_24,nil));
}
objj_msgSend(objj_msgSend(objj_msgSend(_24,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
}
}),new objj_method(sel_getUid("performKeyEquivalent:"),function(_27,_28,_29){
with(_27){
var _2a=objj_msgSend(objj_msgSend(_27,"window"),"firstResponder")==_27;
if(_2a&&objj_msgSend(_29,"_couldBeKeyEquivalent")&&(objj_msgSend(_29,"modifierFlags")&CPPlatformActionKeyMask)){
objj_msgSend(CPTimer,"scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:",0,_27,sel_getUid("keyUp:"),nil,NO);
return YES;
}
objj_msgSend(objj_msgSend(objj_msgSend(_27,"window"),"platformWindow"),"_propagateCurrentDOMEvent:",YES);
return _2a;
}
}),new objj_method(sel_getUid("becomeFirstResponder"),function(_2b,_2c){
with(_2b){
_stringValue=objj_msgSend(_2b,"stringValue");
objj_msgSend(_2b,"setThemeState:",CPThemeStateEditing);
setTimeout(function(){
objj_msgSend(_2b,"_DOMTextareaElement").focus();
_1=_2b;
},0);
objj_msgSend(_2b,"textDidFocus:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidFocusNotification,_2b,nil));
return YES;
}
}),new objj_method(sel_getUid("resignFirstResponder"),function(_2d,_2e){
with(_2d){
objj_msgSend(_2d,"unsetThemeState:",CPThemeStateEditing);
objj_msgSend(_2d,"setStringValue:",objj_msgSend(_2d,"stringValue"));
objj_msgSend(_2d,"_DOMTextareaElement").blur();
if(_isEditing){
_isEditing=NO;
objj_msgSend(_2d,"textDidEndEditing:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPControlTextDidEndEditingNotification,_2d,nil));
if(objj_msgSend(_2d,"sendsActionOnEndEditing")){
objj_msgSend(_2d,"sendAction:to:",objj_msgSend(_2d,"action"),objj_msgSend(_2d,"target"));
}
}
objj_msgSend(_2d,"textDidBlur:",objj_msgSend(CPNotification,"notificationWithName:object:userInfo:",CPTextFieldDidBlurNotification,_2d,nil));
return YES;
}
}),new objj_method(sel_getUid("stringValue"),function(_2f,_30){
with(_2f){
return (!!_DOMTextareaElement)?_DOMTextareaElement.value:"";
}
}),new objj_method(sel_getUid("setStringValue:"),function(_31,_32,_33){
with(_31){
_stringValue=_33;
objj_msgSend(_31,"setNeedsLayout");
}
}),new objj_method(sel_getUid("setTextColor:"),function(_34,_35,_36){
with(_34){
if(!_36){
return;
}
var _37=objj_msgSend(_34,"_DOMTextareaElement");
_37.style.color=objj_msgSend(_36,"cssString");
objj_msgSend(_34,"setValue:forThemeAttribute:",_36,"text-color");
}
}),new objj_method(sel_getUid("setEnabled:"),function(_38,_39,_3a){
with(_38){
objj_msgSendSuper({receiver:_38,super_class:objj_getClass("LPMultiLineTextField").super_class},"setEnabled:",_3a);
var _3b=objj_msgSend(_38,"_DOMTextareaElement");
_3b.disabled=!_3a;
}
}),new objj_method(sel_getUid("setEditable:"),function(_3c,_3d,_3e){
with(_3c){
objj_msgSendSuper({receiver:_3c,super_class:objj_getClass("LPMultiLineTextField").super_class},"setEditable:",_3e);
var _3f=objj_msgSend(_3c,"_DOMTextareaElement");
_3f.readOnly=!_3e;
}
}),new objj_method(sel_getUid("selectedRange"),function(_40,_41){
with(_40){
if(objj_msgSend(objj_msgSend(_40,"window"),"firstResponder")!==_40){
return CPMakeRange(0,0);
}
try{
var _42=objj_msgSend(_40,"_DOMTextareaElement"),_43=_42.selectionStart,_44=_42.selectionEnd;
if(objj_msgSend(_43,"isKindOfClass:",CPNumber)){
return CPMakeRange(_43,_44-_43);
}
var _45=_42.ownerDocument||_42.document,_46=_45.selection.createRange(),_47=_42.createTextRange();
if(_47.inRange(_46)){
_47.setEndPoint("EndToStart",_46);
return CPMakeRange(_47.text.length,_46.text.length);
}
}
catch(e){
}
return CPMakeRange(0,0);
}
}),new objj_method(sel_getUid("setSelectedRange:"),function(_48,_49,_4a){
with(_48){
if(!objj_msgSend(objj_msgSend(_48,"window"),"firstResponder")===_48){
return;
}
var _4b=objj_msgSend(_48,"_DOMTextareaElement");
try{
if(objj_msgSend(_4b.selectionStart,"isKindOfClass:",CPNumber)){
_4b.selectionStart=_4a.location;
_4b.selectionEnd=CPMaxRange(_4a);
}else{
var _4c=_4b.ownerDocument||_4b.document,_4d=_4c.selection.createRange(),_4e=_4b.createTextRange();
if(_4e.inRange(_4d)){
_4e.collapse(true);
_4e.move("character",_4a.location);
_4e.moveEnd("character",_4a.length);
_4e.select();
}
}
}
catch(e){
}
}
})]);
var _4f="LPMultiLineTextFieldStringValueKey",_50="LPMultiLineTextFieldScrollableKey";
var _2=objj_getClass("LPMultiLineTextField");
if(!_2){
throw new SyntaxError("*** Could not find definition for class \"LPMultiLineTextField\"");
}
var _3=_2.isa;
class_addMethods(_2,[new objj_method(sel_getUid("initWithCoder:"),function(_51,_52,_53){
with(_51){
if(_51=objj_msgSendSuper({receiver:_51,super_class:objj_getClass("LPMultiLineTextField").super_class},"initWithCoder:",_53)){
objj_msgSend(_51,"setStringValue:",objj_msgSend(_53,"decodeObjectForKey:",_4f));
objj_msgSend(_51,"setScrollable:",objj_msgSend(_53,"decodeBoolForKey:",_50));
}
return _51;
}
}),new objj_method(sel_getUid("encodeWithCoder:"),function(_54,_55,_56){
with(_54){
objj_msgSendSuper({receiver:_54,super_class:objj_getClass("LPMultiLineTextField").super_class},"encodeWithCoder:",_56);
objj_msgSend(_56,"encodeObject:forKey:",_stringValue,_4f);
objj_msgSend(_56,"encodeBool:forKey:",(_hideOverflow?NO:YES),_50);
}
})]);
p;6;main.jt;267;@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jt;181;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("AppController.j",YES);
main=function(_1,_2){
CPApplicationMain(_1,_2);
};
p;19;NibRuleController.jt;11243;@STATIC;1.0;I;21;Foundation/CPObject.jI;25;AppKit/CPViewController.jI;21;AppKit/CPRuleEditor.jt;11141;
objj_executeFile("Foundation/CPObject.j",NO);
objj_executeFile("AppKit/CPViewController.j",NO);
objj_executeFile("AppKit/CPRuleEditor.j",NO);
var _1=999999;
var _2=objj_allocateClassPair(CPViewController,"NibRuleController"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("compoundRoot"),new objj_ivar("simpleRoot")]);
objj_registerClassPair(_2);
class_addMethods(_2,[new objj_method(sel_getUid("initWithCibName:bundle:"),function(_4,_5,_6,_7){
with(_4){
_4=objj_msgSendSuper({receiver:_4,super_class:objj_getClass("NibRuleController").super_class},"initWithCibName:bundle:",_6,_7);
if(!_4){
return _4;
}
return _4;
}
}),new objj_method(sel_getUid("ruleEditor:numberOfChildrenForCriterion:withRowType:"),function(_8,_9,_a,_b,_c){
with(_8){
if(_b==nil){
if(_c==CPRuleEditorRowTypeSimple){
return objj_msgSend(simpleRoot,"numberOfItems");
}else{
return objj_msgSend(compoundRoot,"numberOfItems");
}
}else{
if(!objj_msgSend(_b,"respondsToSelector:",sel_getUid("target"))){
return 0;
}
var _d=objj_msgSend(_b,"target");
if(!_d||_d==_b){
return 0;
}
if(objj_msgSend(_d,"isKindOfClass:",CPPopUpButton)){
if(objj_msgSend(_8,"item:isChildOfPopUpButton:",_b,_d)){
return 0;
}
return objj_msgSend(_d,"numberOfItems");
}else{
if(objj_msgSend(_d,"isKindOfClass:",CPControl)){
return 1;
}
}
return 0;
}
}
}),new objj_method(sel_getUid("ruleEditor:child:forCriterion:withRowType:"),function(_e,_f,_10,_11,_12,_13){
with(_e){
if(_12==nil){
if(_13==CPRuleEditorRowTypeSimple){
return objj_msgSend(simpleRoot,"itemAtIndex:",_11);
}else{
return objj_msgSend(compoundRoot,"itemAtIndex:",_11);
}
}else{
var _14=objj_msgSend(_12,"target");
if(objj_msgSend(_14,"isKindOfClass:",objj_msgSend(CPPopUpButton,"class"))){
return objj_msgSend(_14,"itemAtIndex:",_11);
}else{
if(objj_msgSend(_14,"isKindOfClass:",objj_msgSend(CPView,"class"))){
var _15=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_14));
objj_msgSend(_15,"setTarget:",objj_msgSend(_14,"target"));
return _15;
}else{
return nil;
}
}
}
}
}),new objj_method(sel_getUid("ruleEditor:displayValueForCriterion:inRow:"),function(_16,_17,_18,_19,row){
with(_16){
if(objj_msgSend(_19,"isKindOfClass:",objj_msgSend(CPMenuItem,"class"))){
if(objj_msgSend(_19,"isSeparatorItem")){
return objj_msgSend(CPMenuItem,"separatorItem");
}else{
return _19;
}
}else{
return objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",objj_msgSend(CPKeyedArchiver,"archivedDataWithRootObject:",_19));
}
}
}),new objj_method(sel_getUid("ruleEditor:predicatePartsForCriterion:withDisplayValue:inRow:"),function(_1a,_1b,_1c,_1d,_1e,row){
with(_1a){
var _1f=objj_msgSend(CPMutableDictionary,"dictionary");
if(objj_msgSend(_1e,"isKindOfClass:",CPMenuItem)){
_1e=objj_msgSend(_1e,"title");
}
if(objj_msgSend(_1e,"isKindOfClass:",CPString)){
if(objj_msgSend(_1e,"isEqual:","Name")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForKeyPath:","kMDItemFSName"),CPRuleEditorPredicateLeftExpression);
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPNumber,"numberWithInt:",CPCaseInsensitivePredicateOption),CPRuleEditorPredicateOptions);
}else{
if(objj_msgSend(_1e,"isEqual:","contains")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPNumber,"numberWithInt:",CPInPredicateOperatorType),CPRuleEditorPredicateOperatorType);
}else{
if(objj_msgSend(_1e,"isEqual:","starts with")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPNumber,"numberWithInt:",CPBeginsWithPredicateOperatorType),CPRuleEditorPredicateOperatorType);
}else{
if(objj_msgSend(_1e,"isEqual:","ends with")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPNumber,"numberWithInt:",CPEndsWithPredicateOperatorType),CPRuleEditorPredicateOperatorType);
}else{
if(objj_msgSend(_1e,"isEqual:","is")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPNumber,"numberWithInt:",CPEqualToPredicateOperatorType),CPRuleEditorPredicateOperatorType);
}else{
if(objj_msgSend(_1e,"isEqual:","Kind")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForKeyPath:","kMDItemContentTypeTree"),CPRuleEditorPredicateLeftExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","images")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeImage"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","text")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeText"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","music")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeAudio"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","folders")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeFolder"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","applications")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeApplication"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","JPEG")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeJPEG"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","TIFF")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeTIFF"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","GIF")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeGIF"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","PNG")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypePNG"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","BMP")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeBMP"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","PDF")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypePDF"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","plain text")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypePlainText"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","RTF")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeRTF"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","HTML")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeHTML"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","XML")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeXML"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","source code")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeSourceCode"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","MP3")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeMP3"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","AAC")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeMPEG4Audio"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","purchased")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:","kUTTypeAppleProtectedMPEG4Audio"),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","Last opened")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForKeyPath:","kMDItemLastUsedDate"),CPRuleEditorPredicateLeftExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","Date created")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForKeyPath:","kMDItemFSCreationDate"),CPRuleEditorPredicateLeftExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","Date modified")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForKeyPath:","kMDItemFSContentChangeDate"),CPRuleEditorPredicateLeftExpression);
}else{
if(objj_msgSend(_1e,"isEqual:","is within last")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPNumber,"numberWithInt:",CPGreaterThanOrEqualToPredicateOperatorType),CPRuleEditorPredicateOperatorType);
}else{
if(objj_msgSend(_1e,"isEqual:","is more than")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPNumber,"numberWithInt:",CPLessThanPredicateOperatorType),CPRuleEditorPredicateOperatorType);
}else{
if(objj_msgSend(_1e,"isEqual:","Any")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPNumber,"numberWithInt:",CPOrPredicateType),CPRuleEditorPredicateCompoundType);
}else{
if(objj_msgSend(_1e,"isEqual:","All")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPNumber,"numberWithInt:",CPAndPredicateType),CPRuleEditorPredicateCompoundType);
}else{
if(objj_msgSend(_1e,"isEqual:","None")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPNumber,"numberWithInt:",CPNotPredicateType),CPRuleEditorPredicateCompoundType);
}else{
if(objj_msgSend(_1e,"isEqual:","Color")){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForKeyPath:","color"),CPRuleEditorPredicateLeftExpression);
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}else{
if(objj_msgSend(_1e,"isKindOfClass:",CPTextField)){
var tag=objj_msgSend(_1d,"tag");
if(tag==_1){
var _20=objj_msgSend(_1e,"intValue")*-1;
var _21=objj_msgSend(objj_msgSend(_1c,"displayValuesForRow:",row),"lastObject");
if(_21=="days"){
_20*=24*3600;
}else{
if(_21=="hours"){
_20*=3600;
}
}
var _22=objj_msgSend(CPDate,"dateWithTimeIntervalSinceNow:",_20);
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:",_22),CPRuleEditorPredicateRightExpression);
}else{
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(_1e,"stringValue")),CPRuleEditorPredicateRightExpression);
}
}else{
if(objj_msgSend(_1e,"isKindOfClass:",CPColorWell)){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(objj_msgSend(_1e,"color"),"cssString")),CPRuleEditorPredicateRightExpression);
}else{
if(objj_msgSend(_1e,"isKindOfClass:",CPControl)){
objj_msgSend(_1f,"setObject:forKey:",objj_msgSend(CPExpression,"expressionForConstantValue:",objj_msgSend(_1e,"objectValue")),CPRuleEditorPredicateRightExpression);
}
}
}
}
return _1f;
}
}),new objj_method(sel_getUid("item:isChildOfPopUpButton:"),function(_23,_24,_25,_26){
with(_23){
if(!_26){
return NO;
}
var _27=objj_msgSend(_26,"menu");
var _28=objj_msgSend(_27,"itemArray");
return objj_msgSend(_28,"indexOfObject:",_25)!=CPNotFound;
}
})]);
p;29;Tests/SPRuleEditorModelTest.jt;33118;@STATIC;1.0;I;23;Foundation/Foundation.ji;35;../CPRuleEditor/CPRuleEditorModel.ji;35;../CPRuleEditor/SPPredicateEditor.jt;32990;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("../CPRuleEditor/CPRuleEditorModel.j",YES);
objj_executeFile("../CPRuleEditor/SPPredicateEditor.j",YES);
var _1=objj_allocateClassPair(OJTestCase,"CPRuleEditorModelTest"),_2=_1.isa;
objj_registerClassPair(_1);
class_addMethods(_1,[new objj_method(sel_getUid("_setupListModel"),function(_3,_4){
with(_3){
var _5=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeList);
for(var i=0;i<5;i++){
objj_msgSend(_5,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",0,CPRuleEditorRowTypeSimple,-1,nil);
}
return _5;
}
}),new objj_method(sel_getUid("_setupCompoundModel"),function(_6,_7){
with(_6){
var _8=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(_8,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
for(var i=0;i<5;i++){
objj_msgSend(_8,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",1,CPRuleEditorRowTypeSimple,0,nil);
}
objj_msgSend(_8,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",3,CPRuleEditorRowTypeCompound,0,nil);
for(var i=0;i<3;i++){
objj_msgSend(_8,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",4,CPRuleEditorRowTypeSimple,3,nil);
}
return _8;
}
}),new objj_method(sel_getUid("_setupComplexCompoundModel"),function(_9,_a){
with(_9){
var _b=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(_b,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
for(var i=0;i<5;i++){
objj_msgSend(_b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",1,CPRuleEditorRowTypeSimple,0,nil);
}
objj_msgSend(_b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",3,CPRuleEditorRowTypeCompound,0,nil);
for(var i=0;i<3;i++){
objj_msgSend(_b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",4,CPRuleEditorRowTypeSimple,3,nil);
}
objj_msgSend(_b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",8,CPRuleEditorRowTypeCompound,0,nil);
for(var i=0;i<3;i++){
objj_msgSend(_b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",9,CPRuleEditorRowTypeSimple,8,nil);
}
objj_msgSend(_b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",10,CPRuleEditorRowTypeCompound,8,nil);
for(var i=0;i<3;i++){
objj_msgSend(_b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",11,CPRuleEditorRowTypeSimple,10,nil);
}
return _b;
}
}),new objj_method(sel_getUid("test_initWithNestingMode_0"),function(_c,_d){
with(_c){
var _e=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeSingle);
objj_msgSend(_c,"assertTrue:",_e!=nil);
objj_msgSend(_c,"assertTrue:",objj_msgSend(_e,"nestingMode")==CPRuleEditorNestingModeSingle);
objj_msgSend(_c,"assertTrue:",objj_msgSend(_e,"rootLess"));
}
}),new objj_method(sel_getUid("test_initWithNestingMode_1"),function(_f,_10){
with(_f){
var _11=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeList);
objj_msgSend(_f,"assertTrue:",_11!=nil);
objj_msgSend(_f,"assertTrue:",objj_msgSend(_11,"nestingMode")==CPRuleEditorNestingModeList);
objj_msgSend(_f,"assertTrue:",objj_msgSend(_11,"rootLess"));
}
}),new objj_method(sel_getUid("test_initWithNestingMode_2"),function(_12,_13){
with(_12){
var _14=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(_12,"assertTrue:",_14!=nil);
objj_msgSend(_12,"assertTrue:",objj_msgSend(_14,"nestingMode")==CPRuleEditorNestingModeCompound);
objj_msgSend(_12,"assertFalse:",objj_msgSend(_14,"rootLess"));
}
}),new objj_method(sel_getUid("test_initWithNestingMode_3"),function(_15,_16){
with(_15){
var _17=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeSimple);
objj_msgSend(_15,"assertTrue:",_17!=nil);
objj_msgSend(_15,"assertTrue:",objj_msgSend(_17,"nestingMode")==CPRuleEditorNestingModeSimple);
objj_msgSend(_15,"assertFalse:",objj_msgSend(_17,"rootLess"));
}
}),new objj_method(sel_getUid("test_allowNewRowInsertOfType_withParent_"),function(_18,_19){
with(_18){
var _1a=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeSingle);
objj_msgSend(_18,"assertTrue:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeSimple,nil));
objj_msgSend(_18,"assertFalse:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeCompound,nil));
_1a=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeList);
objj_msgSend(_18,"assertTrue:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeSimple,nil));
objj_msgSend(_18,"assertFalse:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeCompound,nil));
_1a=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeSimple);
objj_msgSend(_1a,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
objj_msgSend(_18,"assertTrue:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeSimple,objj_msgSend(_1a,"rowAtIndex:",0)));
objj_msgSend(_18,"assertFalse:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeCompound,objj_msgSend(_1a,"rowAtIndex:",0)));
_1a=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(_1a,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
objj_msgSend(_18,"assertTrue:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeSimple,objj_msgSend(_1a,"rowAtIndex:",0)));
objj_msgSend(_18,"assertTrue:",objj_msgSend(_1a,"allowNewRowInsertOfType:withParent:",CPRuleEditorRowTypeCompound,objj_msgSend(_1a,"rowAtIndex:",0)));
}
}),new objj_method(sel_getUid("test_addNewRowOfType_"),function(_1b,_1c){
with(_1b){
var _1d=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeSingle);
var row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeSimple,nil);
objj_msgSend(_1b,"assertTrue:message:",row!=nil,"Subtest 1.1 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 1.2 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 1.3 failed");
row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeSimple,nil);
objj_msgSend(_1b,"assertTrue:message:",row==nil,"Subtest 1.4 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 1.5 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 1.6 failed");
_1d=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeList);
row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeSimple,nil);
objj_msgSend(_1b,"assertTrue:message:",row!=nil,"Subtest 2.1 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 2.2 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 2.3 failed");
row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
objj_msgSend(_1b,"assertTrue:message:",row==nil,"Subtest 2.4 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 2.5 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 2.6 failed");
_1d=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeSimple);
objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeSimple,nil);
objj_msgSend(_1b,"assertTrue:message:",row==nil,"Subtest 3.1 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 3.2 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 3.3 failed");
row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
objj_msgSend(_1b,"assertTrue:message:",row==nil,"Subtest 3.4 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 3.5 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 3.6 failed");
_1d=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeSimple,nil);
objj_msgSend(_1b,"assertTrue:message:",row==nil,"Subtest 4.1 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 4.2 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 4.3 failed");
row=objj_msgSend(_1d,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
objj_msgSend(_1b,"assertTrue:message:",row==nil,"Subtest 4.4 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"rowsCount")==1,"Subtest 4.5 failed");
objj_msgSend(_1b,"assertTrue:message:",objj_msgSend(_1d,"flatRowsCount")==1,"Subtest 4.6 failed");
}
}),new objj_method(sel_getUid("test_rowAtIndex_indexOfRow_"),function(_1e,_1f){
with(_1e){
var _20=objj_msgSend(_1e,"_setupComplexCompoundModel");
objj_msgSend(_1e,"assertTrue:message:",objj_msgSend(_20,"rowsCount")==1,"Subtest 1.1 failed");
objj_msgSend(_1e,"assertTrue:message:",objj_msgSend(_20,"flatRowsCount")==18,"Subtest 1.2 failed");
var row,_21;
for(var i=0;i<18;i++){
row=objj_msgSend(_20,"rowAtIndex:",i);
_21=objj_msgSend(_20,"indexOfRow:",row);
objj_msgSend(_1e,"assertTrue:message:",(i==_21),"Subtest 1.3 failed");
}
}
}),new objj_method(sel_getUid("test_immediateSubrowsIndexesOfRowAtIndex_"),function(_22,_23){
with(_22){
var _24=objj_msgSend(_22,"_setupComplexCompoundModel");
indexSet=objj_msgSend(_24,"immediateSubrowsIndexesOfRowAtIndex:",0);
expected=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(expected,"addIndex:",1);
objj_msgSend(expected,"addIndex:",2);
objj_msgSend(expected,"addIndex:",3);
objj_msgSend(expected,"addIndex:",7);
objj_msgSend(expected,"addIndex:",8);
objj_msgSend(expected,"addIndex:",16);
objj_msgSend(expected,"addIndex:",17);
objj_msgSend(_22,"assertTrue:message:",indexSet!=nil,"Subtest 1.1 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"count")==7,"Subtest 1.2 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"isEqualToIndexSet:",expected),"Subtest 1.3 failed");
indexSet=objj_msgSend(_24,"immediateSubrowsIndexesOfRowAtIndex:",1);
objj_msgSend(_22,"assertTrue:message:",indexSet==nil,"Subtest 2.1 failed");
indexSet=objj_msgSend(_24,"immediateSubrowsIndexesOfRowAtIndex:",3);
expected=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(expected,"addIndex:",4);
objj_msgSend(expected,"addIndex:",5);
objj_msgSend(expected,"addIndex:",6);
objj_msgSend(_22,"assertTrue:message:",indexSet!=nil,"Subtest 3.1 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"count")==3,"Subtest 3.2 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"isEqualToIndexSet:",expected),"Subtest 3.3 failed");
indexSet=objj_msgSend(_24,"immediateSubrowsIndexesOfRowAtIndex:",8);
expected=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(expected,"addIndex:",9);
objj_msgSend(expected,"addIndex:",10);
objj_msgSend(expected,"addIndex:",14);
objj_msgSend(expected,"addIndex:",15);
objj_msgSend(_22,"assertTrue:message:",indexSet!=nil,"Subtest 4.1 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"count")==4,"Subtest 4.2 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"isEqualToIndexSet:",expected),"Subtest 4.3 failed");
indexSet=objj_msgSend(_24,"immediateSubrowsIndexesOfRowAtIndex:",10);
expected=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(expected,"addIndex:",11);
objj_msgSend(expected,"addIndex:",12);
objj_msgSend(expected,"addIndex:",13);
objj_msgSend(_22,"assertTrue:message:",indexSet!=nil,"Subtest 5.1 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"count")==3,"Subtest 5.2 failed");
objj_msgSend(_22,"assertTrue:message:",objj_msgSend(indexSet,"isEqualToIndexSet:",expected),"Subtest 5.3 failed");
}
}),new objj_method(sel_getUid("test_insertNewRowAtIndex_ofType_withParentRowIndex"),function(_25,_26){
with(_25){
var _27,row,_28,_29;
var _2a=0;
var _2b=objj_msgSend(objj_msgSend(CPRuleEditorModel,"alloc"),"initWithNestingMode:",CPRuleEditorNestingModeCompound);
objj_msgSend(_2b,"addNewRowOfType:criteria:",CPRuleEditorRowTypeCompound,nil);
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",0,CPRuleEditorRowTypeSimple,0,nil);
objj_msgSend(_25,"assertTrue:message:",row==nil,"Subtest 1 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",1,CPRuleEditorRowTypeSimple,0,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 2.1 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(row,"parent")!=nil,"Subtest 2.2 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 2.3 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",1,CPRuleEditorRowTypeSimple,0,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 3 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",2,CPRuleEditorRowTypeSimple,0,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 4 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",4,CPRuleEditorRowTypeSimple,0,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 5 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",3,CPRuleEditorRowTypeSimple,0,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 6 failed");
var _2c=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",3,CPRuleEditorRowTypeCompound,0,nil);
objj_msgSend(_25,"assertTrue:message:",_2c!=nil,"Subtest 7 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",4,CPRuleEditorRowTypeSimple,3,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 8.1 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(row,"depth")==2,"Subtest 8.2 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,3,nil);
objj_msgSend(_25,"assertTrue:message:",row==nil,"Subtest 9 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",3,CPRuleEditorRowTypeSimple,3,nil);
objj_msgSend(_25,"assertTrue:message:",row==nil,"Subtest 10 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",2,CPRuleEditorRowTypeSimple,3,nil);
objj_msgSend(_25,"assertTrue:message:",row==nil,"Subtest 11 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",4,CPRuleEditorRowTypeSimple,3,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 12 failed");
row=objj_msgSend(_2b,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",5,CPRuleEditorRowTypeSimple,3,nil);
objj_msgSend(_25,"assertTrue:message:",row!=nil,"Subtest 13 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(_2b,"rowsCount")==1,"Subtest 14.1 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(_2b,"flatRowsCount")==10,"Subtest 14.2 failed");
_29=objj_msgSend(_2b,"rowAtIndex:",0);
_27=objj_msgSend(_29,"subrowsCount");
for(var i=0;i<_27;i++){
row=objj_msgSend(_29,"childAtIndex:",i);
if(i==2){
objj_msgSend(_25,"assertTrue:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeCompound);
var _2d;
var _2e=objj_msgSend(row,"subrowsCount");
objj_msgSend(_25,"assertTrue:",_2e==3);
for(var j=0;j<_2e;j++){
_2d=objj_msgSend(row,"childAtIndex:",j);
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(_2d,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 14.4 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(_2d,"parent")==row,"Subtest 14.5 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(_2d,"depth")==2,"Subtest 14.6 failed");
}
continue;
}
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 14.7 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(row,"parent")==_29,"Subtest 14.8 failed");
objj_msgSend(_25,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 14.9 failed");
}
}
}),new objj_method(sel_getUid("test_removeRowAtIndex_includeSubrows_yes"),function(_2f,_30){
with(_2f){
var _31,row,_32,_33;
var _34=objj_msgSend(_2f,"_setupCompoundModel");
_33=objj_msgSend(_34,"rowAtIndex:",0);
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"rowsCount")==1,"Subtest 1.1 failed");
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"flatRowsCount")==10,"Subtest 1.2 failed");
objj_msgSend(_34,"removeRowAtIndex:includeSubrows:",0,YES);
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"rowsCount")==1,"Subtest 2.1 failed");
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"flatRowsCount")==10,"Subtest 2.2 failed");
objj_msgSend(_34,"removeRowAtIndex:includeSubrows:",2,YES);
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"rowsCount")==1,"Subtest 3.1 failed");
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"flatRowsCount")==9,"Subtest 3.2 failed");
objj_msgSend(_34,"removeRowAtIndex:includeSubrows:",4,YES);
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"rowsCount")==1,"Subtest 4.1 failed");
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"flatRowsCount")==8,"Subtest 4.2 failed");
objj_msgSend(_34,"removeRowAtIndex:includeSubrows:",2,YES);
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"rowsCount")==1,"Subtest 5.1 failed");
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(_34,"flatRowsCount")==5,"Subtest 5.2 failed");
_31=objj_msgSend(_33,"subrowsCount");
for(var i=0;i<_31;i++){
row=objj_msgSend(_33,"childAtIndex:",i);
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 6.2 failed");
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(row,"parent")==_33,"Subtest 6.3 failed");
objj_msgSend(_2f,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 6.4 failed");
}
}
}),new objj_method(sel_getUid("test_setCanRemoveAllRows"),function(_35,_36){
with(_35){
var _37=objj_msgSend(_35,"_setupListModel");
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"rowsCount")==5,"Subtest 1.1 failed");
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"flatRowsCount")==5,"Subtest 1.2 failed");
objj_msgSend(_37,"setCanRemoveAllRows:",NO);
for(var i=0;i<5;i++){
objj_msgSend(_37,"removeRowAtIndex:includeSubrows:",0,YES);
}
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"flatRowsCount")==1,"Subtest 1.3 failed");
_37=objj_msgSend(_35,"_setupListModel");
objj_msgSend(_37,"setCanRemoveAllRows:",YES);
for(var i=0;i<5;i++){
objj_msgSend(_37,"removeRowAtIndex:includeSubrows:",0,YES);
}
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"flatRowsCount")==0,"Subtest 2.1 failed");
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"rowsCount")==0,"Subtest 2.2 failed");
_37=objj_msgSend(_35,"_setupCompoundModel");
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"rowsCount")==1,"Subtest 3.1 failed");
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"flatRowsCount")==10,"Subtest 3.2 failed");
objj_msgSend(_37,"setCanRemoveAllRows:",NO);
objj_msgSend(_37,"removeRowAtIndex:includeSubrows:",0,YES);
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"rowsCount")==1,"Subtest 3.3 failed");
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"flatRowsCount")==10,"Subtest 3.4 failed");
objj_msgSend(_37,"setCanRemoveAllRows:",YES);
objj_msgSend(_37,"removeRowAtIndex:includeSubrows:",0,YES);
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"rowsCount")==0,"Subtest 3.5 failed");
objj_msgSend(_35,"assertTrue:message:",objj_msgSend(_37,"flatRowsCount")==0,"Subtest 3.6 failed");
}
}),new objj_method(sel_getUid("test_removeRowAtIndex_includeSubrows_no"),function(_38,_39){
with(_38){
var _3a,row,_3b,_3c;
var _3d=objj_msgSend(_38,"_setupCompoundModel");
_3c=objj_msgSend(_3d,"rowAtIndex:",0);
objj_msgSend(_3d,"removeRowAtIndex:includeSubrows:",0,NO);
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"rowsCount")==1,"Subtest 1.1 failed");
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"flatRowsCount")==10,"Subtest 1.2 failed");
objj_msgSend(_3d,"removeRowAtIndex:includeSubrows:",2,NO);
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"rowsCount")==1,"Subtest 2.1 failed");
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"flatRowsCount")==9,"Subtest 2.2 failed");
objj_msgSend(_3d,"removeRowAtIndex:includeSubrows:",4,NO);
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"rowsCount")==1,"Subtest 3.1 failed");
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"flatRowsCount")==8,"Subtest 3.2 failed");
objj_msgSend(_3d,"removeRowAtIndex:includeSubrows:",2,NO);
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"rowsCount")==1,"Subtest 4.1 failed");
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(_3d,"flatRowsCount")==7,"Subtest 4.2 failed");
_3a=objj_msgSend(_3c,"subrowsCount");
objj_msgSend(_38,"assertTrue:message:",_3a==6,"Subtest 5.1 failed");
for(var i=0;i<_3a;i++){
row=objj_msgSend(_3c,"childAtIndex:",i);
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 5.2 failed");
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(row,"parent")==_3c,"Subtest 5.3 failed");
objj_msgSend(_38,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 5.4 failed");
}
}
}),new objj_method(sel_getUid("test_removeRowsAtIndexes_includeSubrows_yes_0"),function(_3e,_3f){
with(_3e){
var _40,row,_41,_42;
var _43=objj_msgSend(_3e,"_setupCompoundModel");
_42=objj_msgSend(_43,"rowAtIndex:",0);
_41=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_41,"addIndex:",1);
objj_msgSend(_41,"addIndex:",5);
objj_msgSend(_41,"addIndex:",8);
objj_msgSend(_43,"removeRowsAtIndexes:includeSubrows:",_41,YES);
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(_43,"rowsCount")==1,"Subtest 1.1 failed");
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(_43,"flatRowsCount")==7,"Subtest 1.2 failed");
row=objj_msgSend(_43,"rowAtIndex:",2);
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeCompound,"Subtest 1.3 failed");
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(row,"subrowsCount")==2,"Subtest 1.4 failed");
_41=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_41,"addIndex:",2);
objj_msgSend(_41,"addIndex:",4);
objj_msgSend(_43,"removeRowsAtIndexes:includeSubrows:",_41,YES);
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(_43,"rowsCount")==1,"Subtest 2.1 failed");
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(_43,"flatRowsCount")==4,"Subtest 2.2 failed");
_42=objj_msgSend(_43,"rowAtIndex:",0);
_40=objj_msgSend(_42,"subrowsCount");
for(var i=0;i<_40;i++){
row=objj_msgSend(_42,"childAtIndex:",i);
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 2.3 failed");
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(row,"parent")==_42,"Subtest 2.4 failed");
objj_msgSend(_3e,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 2.5 failed");
}
}
}),new objj_method(sel_getUid("test_removeRowsAtIndexes_includeSubrows_yes_1"),function(_44,_45){
with(_44){
var _46,row,_47,_48;
var _49=objj_msgSend(_44,"_setupCompoundModel");
_48=objj_msgSend(_49,"rowAtIndex:",0);
objj_msgSend(_49,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",5,CPRuleEditorRowTypeCompound,3,nil);
objj_msgSend(_49,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_49,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_49,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"rowsCount")==1,"Subtest 3.1 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"flatRowsCount")==14,"Subtest 3.2 failed");
_47=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_47,"addIndex:",2);
objj_msgSend(_47,"addIndex:",7);
objj_msgSend(_47,"addIndex:",12);
objj_msgSend(_49,"removeRowsAtIndexes:includeSubrows:",_47,YES);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"rowsCount")==1,"Subtest 4.1 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"flatRowsCount")==11,"Subtest 4.2 failed");
row=objj_msgSend(_48,"childAtIndex:",1);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeCompound,"Subtest 4.3 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"parent")==_48,"Subtest 4.4 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 4.5 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"subrowsCount")==4,"Subtest 4.6 failed");
var _4a=objj_msgSend(row,"childAtIndex:",1);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_4a,"rowType")==CPRuleEditorRowTypeCompound,"Subtest 4.7 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_4a,"parent")==row,"Subtest 4.8 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_4a,"depth")==2,"Subtest 4.9 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_4a,"subrowsCount")==2,"Subtest 4.10 failed");
_47=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_47,"addIndex:",1);
objj_msgSend(_47,"addIndex:",4);
objj_msgSend(_49,"removeRowsAtIndexes:includeSubrows:",_47,YES);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"rowsCount")==1,"Subtest 5.1 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"flatRowsCount")==7,"Subtest 5.2 failed");
row=objj_msgSend(_48,"childAtIndex:",0);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeCompound,"Subtest 5.3 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"parent")==_48,"Subtest 5.4 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 5.5 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"subrowsCount")==3,"Subtest 5.6 failed");
_47=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_47,"addIndex:",1);
objj_msgSend(_47,"addIndex:",3);
objj_msgSend(_47,"addIndex:",6);
objj_msgSend(_49,"removeRowsAtIndexes:includeSubrows:",_47,YES);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"rowsCount")==1,"Subtest 6.1 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(_49,"flatRowsCount")==2,"Subtest 6.2 failed");
row=objj_msgSend(_48,"childAtIndex:",0);
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 6.3 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"parent")==_48,"Subtest 6.4 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 6.5 failed");
objj_msgSend(_44,"assertTrue:message:",objj_msgSend(row,"subrowsCount")==0,"Subtest 6.6 failed");
}
}),new objj_method(sel_getUid("test_removeRowsAtIndexes_includeSubrows_no_0"),function(_4b,_4c){
with(_4b){
var _4d,row,_4e,_4f;
var _50=objj_msgSend(_4b,"_setupCompoundModel");
_4f=objj_msgSend(_50,"rowAtIndex:",0);
_4e=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_4e,"addIndex:",1);
objj_msgSend(_4e,"addIndex:",5);
objj_msgSend(_4e,"addIndex:",8);
objj_msgSend(_50,"removeRowsAtIndexes:includeSubrows:",_4e,NO);
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(_50,"rowsCount")==1,"Subtest 1.1 failed");
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(_50,"flatRowsCount")==7,"Subtest 1.2 failed");
row=objj_msgSend(_4f,"childAtIndex:",1);
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeCompound,"Subtest 1.3 failed");
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(row,"subrowsCount")==2,"Subtest 1.4 failed");
_4e=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_4e,"addIndex:",2);
objj_msgSend(_4e,"addIndex:",4);
objj_msgSend(_50,"removeRowsAtIndexes:includeSubrows:",_4e,NO);
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(_50,"rowsCount")==1,"Subtest 2.1 failed");
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(_50,"flatRowsCount")==5,"Subtest 2.2 failed");
_4d=objj_msgSend(_4f,"subrowsCount");
for(var i=0;i<_4d;i++){
row=objj_msgSend(_4f,"childAtIndex:",i);
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 2.3 failed");
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(row,"parent")==_4f,"Subtest 2.4 failed");
objj_msgSend(_4b,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 2.5 failed");
}
}
}),new objj_method(sel_getUid("test_removeRowsAtIndexes_includeSubrows_no_1"),function(_51,_52){
with(_51){
var _53,row,_54,_55;
var _56=objj_msgSend(_51,"_setupCompoundModel");
_55=objj_msgSend(_56,"rowAtIndex:",0);
objj_msgSend(_56,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",5,CPRuleEditorRowTypeCompound,3,nil);
objj_msgSend(_56,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_56,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_56,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_51,"assertTrue:message:",objj_msgSend(_56,"rowsCount")==1,"Subtest 3.1 failed");
objj_msgSend(_51,"assertTrue:message:",objj_msgSend(_56,"flatRowsCount")==14,"Subtest 3.2 failed");
_54=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_54,"addIndex:",1);
objj_msgSend(_54,"addIndex:",3);
objj_msgSend(_54,"addIndex:",5);
objj_msgSend(_54,"addIndex:",7);
objj_msgSend(_54,"addIndex:",12);
objj_msgSend(_56,"removeRowsAtIndexes:includeSubrows:",_54,NO);
objj_msgSend(_51,"assertTrue:message:",objj_msgSend(_56,"rowsCount")==1,"Subtest 4.1 failed");
objj_msgSend(_51,"assertTrue:message:",objj_msgSend(_56,"flatRowsCount")==9,"Subtest 4.2 failed");
_53=objj_msgSend(_55,"subrowsCount");
for(var i=0;i<_53;i++){
row=objj_msgSend(_55,"childAtIndex:",i);
objj_msgSend(_51,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 4.3 failed");
objj_msgSend(_51,"assertTrue:message:",objj_msgSend(row,"parent")==_55,"Subtest 4.4 failed");
objj_msgSend(_51,"assertTrue:message:",objj_msgSend(row,"depth")==1,"Subtest 4.5 failed");
}
}
}),new objj_method(sel_getUid("test_removeRowsAtIndexes_includeSubrows_no_2"),function(_57,_58){
with(_57){
var _59,row,_5a,_5b;
var _5c=objj_msgSend(_57,"_setupCompoundModel");
_5b=objj_msgSend(_5c,"rowAtIndex:",0);
objj_msgSend(_5c,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",5,CPRuleEditorRowTypeCompound,3,nil);
objj_msgSend(_5c,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_5c,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_5c,"insertNewRowAtIndex:ofType:withParentRowIndex:criteria:",6,CPRuleEditorRowTypeSimple,5,nil);
objj_msgSend(_57,"assertTrue:message:",objj_msgSend(_5c,"rowsCount")==1,"Subtest 5.1 failed");
objj_msgSend(_57,"assertTrue:message:",objj_msgSend(_5c,"flatRowsCount")==14,"Subtest 5.2 failed");
_5a=objj_msgSend(objj_msgSend(CPMutableIndexSet,"alloc"),"init");
objj_msgSend(_5a,"addIndex:",1);
objj_msgSend(_5a,"addIndex:",2);
objj_msgSend(_5a,"addIndex:",5);
objj_msgSend(_5a,"addIndex:",11);
objj_msgSend(_5a,"addIndex:",13);
objj_msgSend(_5c,"removeRowsAtIndexes:includeSubrows:",_5a,NO);
objj_msgSend(_57,"assertTrue:message:",objj_msgSend(_5c,"rowsCount")==1,"Subtest 6.1 failed");
objj_msgSend(_57,"assertTrue:message:",objj_msgSend(_5c,"flatRowsCount")==9,"Subtest 6.2 failed");
var _5d=objj_msgSend(_5b,"childAtIndex:",0);
_59=objj_msgSend(_5d,"subrowsCount");
for(var i=0;i<_59;i++){
row=objj_msgSend(_5d,"childAtIndex:",i);
objj_msgSend(_57,"assertTrue:message:",objj_msgSend(row,"rowType")==CPRuleEditorRowTypeSimple,"Subtest 6.3 failed");
objj_msgSend(_57,"assertTrue:message:",objj_msgSend(row,"parent")==_5d,"Subtest 6.4 failed");
objj_msgSend(_57,"assertTrue:message:",objj_msgSend(row,"depth")==2,"Subtest 6.5 failed");
}
}
})]);
e;