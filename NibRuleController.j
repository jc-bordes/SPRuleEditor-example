/*
 * NibRuleController.j
 *
 * Created by JC Bordes jcbordes@gmail.com
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
 */

@import <Foundation/CPObject.j>
@import <AppKit/CPViewController.j> 
@import <SPPredicateEditor/SPRuleEditor.j>

var DURATION_TAG=999999;

@implementation NibRuleController : CPViewController
{
	@outlet CPControl compoundRoot;
	@outlet CPControl simpleRoot;
}

- (id)initWithCibName:(CPString)cibName bundle:(CPBundle)bundle
{
	self=[super initWithCibName:cibName bundle:bundle];
	if(!self)
		return self;

	return self;
}

- (CPInteger)ruleEditor:(SPRuleEditor)editor numberOfChildrenForCriterion:(id)criterion withRowType:(int)rowType 
{
    if (criterion == nil) 
    {
		if (rowType == SPRuleEditorRowTypeSimple) 
			return [simpleRoot numberOfItems];
		else 
			return [compoundRoot numberOfItems];
    }
    else 
    {
    	if(![criterion respondsToSelector:@selector(target)])
    		return 0;
    		
		var target = [criterion target];
		if(!target||target==criterion)
			return 0;
		
		if ([target isKindOfClass:CPPopUpButton]) 
		{
            if([self item:criterion isChildOfPopUpButton:target])
            	return 0;		
			return [target numberOfItems];
		}
		else
		if ([target isKindOfClass:CPControl]) 
			return 1;
		return 0;
    }
}

- (id)ruleEditor:(SPRuleEditor)editor child:(CPInteger)index forCriterion:(id)criterion withRowType:(int)rowType 
{
    if (criterion == nil) 
    {
		if (rowType == SPRuleEditorRowTypeSimple) 
			return [simpleRoot itemAtIndex:index];
		else 
			return [compoundRoot itemAtIndex:index];
    }
    else 
    {
		var target = [criterion target];

		if ([target isKindOfClass:[CPPopUpButton class]]) 
			return [target itemAtIndex:index];
		else if ([target isKindOfClass:[CPView class]]) 
		{
		    var newTarget=[CPKeyedUnarchiver unarchiveObjectWithData:[CPKeyedArchiver archivedDataWithRootObject:target]];
		    [newTarget setTarget:[target target]];
		    return newTarget;
		}
		else 
			return nil;
    }
}

- (id)ruleEditor:(SPRuleEditor)editor displayValueForCriterion:(id)criterion inRow:(CPInteger)row 
{
    if ([criterion isKindOfClass:[CPMenuItem class]]) 
    {
		if ([criterion isSeparatorItem])
			return [CPMenuItem separatorItem];
		else 
			return criterion;
    }
    else 
	    return [CPKeyedUnarchiver unarchiveObjectWithData:[CPKeyedArchiver archivedDataWithRootObject:criterion]];
}

- (CPDictionary)ruleEditor:(SPRuleEditor)editor predicatePartsForCriterion:(id)criterion withDisplayValue:(id)value inRow:(CPInteger)row 
{
    var result=[CPMutableDictionary dictionary];
    
    if([value isKindOfClass:CPMenuItem])
    	value=[value title];
    
    if([value isKindOfClass:CPString]) 
    {
		if ([value isEqual:@"Name"]) 
		{
	    	[result setObject:[CPExpression expressionForKeyPath:@"kMDItemFSName"] forKey:SPRuleEditorPredicateLeftExpression];
	    	[result setObject:[CPNumber numberWithInt:CPCaseInsensitivePredicateOption] forKey:SPRuleEditorPredicateOptions];
		}
		else if([value isEqual:@"contains"]) 
			[result setObject:[CPNumber numberWithInt:CPInPredicateOperatorType] forKey:SPRuleEditorPredicateOperatorType];
		else if ([value isEqual:@"starts with"]) 
			[result setObject:[CPNumber numberWithInt:CPBeginsWithPredicateOperatorType] forKey:SPRuleEditorPredicateOperatorType];
		else if([value isEqual:@"ends with"]) 
			[result setObject:[CPNumber numberWithInt:CPEndsWithPredicateOperatorType] forKey:SPRuleEditorPredicateOperatorType];
		else if([value isEqual:@"is"]) 
			[result setObject:[CPNumber numberWithInt:CPEqualToPredicateOperatorType] forKey:SPRuleEditorPredicateOperatorType];
		else if ([value isEqual:@"Kind"]) 
			[result setObject:[CPExpression expressionForKeyPath:@"kMDItemContentTypeTree"] forKey:SPRuleEditorPredicateLeftExpression];
		else if ([value isEqual:@"images"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeImage"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"text"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeText"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"music"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeAudio"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"folders"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeFolder"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"applications"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeApplication"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"JPEG"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeJPEG"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"TIFF"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeTIFF"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"GIF"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeGIF"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"PNG"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypePNG"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"BMP"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeBMP"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"PDF"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypePDF"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"plain text"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypePlainText"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"RTF"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeRTF"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"HTML"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeHTML"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"XML"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeXML"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"source code"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeSourceCode"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"MP3"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeMP3"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"AAC"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeMPEG4Audio"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"purchased"]) 
			[result setObject:[CPExpression expressionForConstantValue:@"kUTTypeAppleProtectedMPEG4Audio"] forKey:SPRuleEditorPredicateRightExpression];
		else if ([value isEqual:@"Last opened"]) 
			[result setObject:[CPExpression expressionForKeyPath:@"kMDItemLastUsedDate"] forKey:SPRuleEditorPredicateLeftExpression];
		else if ([value isEqual:@"Date created"]) 
			[result setObject:[CPExpression expressionForKeyPath:@"kMDItemFSCreationDate"] forKey:SPRuleEditorPredicateLeftExpression];
		else if ([value isEqual:@"Date modified"]) 
			[result setObject:[CPExpression expressionForKeyPath:@"kMDItemFSContentChangeDate"] forKey:SPRuleEditorPredicateLeftExpression];
		else if ([value isEqual:@"is within last"]) 
			[result setObject:[CPNumber numberWithInt:CPGreaterThanOrEqualToPredicateOperatorType] forKey:SPRuleEditorPredicateOperatorType];
		else if ([value isEqual:@"is more than"]) 
			[result setObject:[CPNumber numberWithInt:CPLessThanPredicateOperatorType] forKey:SPRuleEditorPredicateOperatorType];
		else if ([value isEqual:@"Any"]) 
			[result setObject:[CPNumber numberWithInt:CPOrPredicateType] forKey:SPRuleEditorPredicateCompoundType];
		else if ([value isEqual:@"All"]) 
			[result setObject:[CPNumber numberWithInt:CPAndPredicateType] forKey:SPRuleEditorPredicateCompoundType];
		else if ([value isEqual:@"None"]) 
			[result setObject:[CPNumber numberWithInt:CPNotPredicateType] forKey:SPRuleEditorPredicateCompoundType];
		else if ([value isEqual:@"Color"]) 
			[result setObject:[CPExpression expressionForKeyPath:@"color"] forKey:SPRuleEditorPredicateLeftExpression];
    }
    else 
	if ([value isKindOfClass:CPTextField]) 
	{
		var tag=[criterion tag];
		if(tag==DURATION_TAG)
		{
			var delta=[value intValue]*-1;
			var unit=[[editor displayValuesForRow:row] lastObject];

			if(unit=="days")
				delta*=24*3600;
			else
			if(unit=="hours")
				delta*=3600;
			var date=[CPDate dateWithTimeIntervalSinceNow:delta];					
			[result setObject:[CPExpression expressionForConstantValue:date] forKey:SPRuleEditorPredicateRightExpression];
		}
		else
			[result setObject:[CPExpression expressionForConstantValue:[value stringValue]] forKey:SPRuleEditorPredicateRightExpression];
	}
	else
	if ([value isKindOfClass:CPColorWell]) 
	{
		[result setObject:[CPExpression expressionForConstantValue:[[value color] cssString]] forKey:SPRuleEditorPredicateRightExpression];
	}
	else
	if ([value isKindOfClass:CPControl]) 
	{
		[result setObject:[CPExpression expressionForConstantValue:[value objectValue]] forKey:SPRuleEditorPredicateRightExpression];
    }
    return result;
}


-(BOOL)item:(id)item isChildOfPopUpButton:(CPPopUpButton)popUpButton
{
	if(!popUpButton)
		return NO;
	var menu=[popUpButton menu];
	var items=[menu itemArray];
	return [items indexOfObject:item]!=CPNotFound;
}

@end