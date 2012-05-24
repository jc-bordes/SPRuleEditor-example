@STATIC;1.0;I;21;Foundation/CPObject.jI;25;AppKit/CPViewController.jI;21;AppKit/CPRuleEditor.jt;11141;
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
