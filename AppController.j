/*
 * AppController.j
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
@import <AppKit/CPScrollView.j>
@import <AppKit/CPSegmentedControl.j>
@import <SPPredicateEditor/SPRuleEditor.j>
@import "LPMultiLineTextField.j"

@import "NibRuleController.j"

@implementation AppController : CPObject
{
   	@outlet CPWindow    theWindow; //this "outlet" is connected automatically by the Cib
	@outlet CPScrollView scrollView;
   	@outlet SPRuleEditor editor;
   	@outlet LPMultiLineTextField predicateField;
   	@outlet CPButton refreshButton;
   	@outlet CPButton autoRefreshButton;
	@outlet CPTextField rowHeightField;
	@outlet CPView bgView;
	@outlet CPView appView;
	
	BOOL _autoRefresh;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    [bgView setBackgroundColor:[CPColor colorWithHexString:@"777777"]];
    [appView setBackgroundColor:[CPColor colorWithHexString:@"ededed"]];
    
    var dom=appView._DOMElement;
    dom.style.borderRadius="10px";
    dom.style.boxShadow="rgba(0, 0, 0, 0.5) 0px 0px 30px";
    dom.style.mozBoxShadow="rgba(0, 0, 0, 0.5) 0px 0px 30px";
	dom.style.webkitBoxShadow="rgba(0, 0, 0, 0.5) 0px 0px 30px";

	_autoRefresh=([autoRefreshButton state]==CPOnState);
	[rowHeightField setStringValue:[editor rowHeight]];

	[editor addRow:nil];
}

- (void)awakeFromCib
{
    [theWindow setFullPlatformWindow:YES];

	[CPScrollView setGlobalScrollerStyle:CPScrollerStyleOverlay];
	[scrollView setBackgroundColor:[CPColor colorWithHexString:@"ededed"]];
    [[theWindow contentView] setBackgroundColor:[CPColor colorWithHexString:@"ededed"]];

	var ruleEditorDelegate=[[NibRuleController alloc] initWithCibName:@"NibRuleControllerViews" bundle:[CPBundle mainBundle]];
	[ruleEditorDelegate view]; // force loading outlets from cib
	[editor setDelegate:ruleEditorDelegate];
	
	[predicateField setTextColor:[CPColor blackColor]];
	[predicateField setEditable:NO];
	
	[[CPNotificationCenter defaultCenter] addObserver:self selector:@selector(rowsDidChange:) name:SPRuleEditorRowsDidChangeNotification object:editor];
}

-(void)refreshPredicate
{
	[editor reloadPredicate];
	var predicate=[editor predicate];
	var text=[predicate predicateFormat];
	
	[predicateField setStringValue:text];
}

-(void)rowsDidChange:(CPNotification)notification
{
	if(_autoRefresh)
		[self refreshPredicate];
}

-(@action)stateChanged:(id)sender
{
	[editor setEditable:[sender selectedSegment]==0];
}

-(@action)modeChanged:(id)sender
{
	var selectedSegment=[sender selectedSegment];
	switch(selectedSegment)
	{
		case 0 :
			[editor setNestingMode:SPRuleEditorNestingModeCompound];
			[editor addRow:nil];
		break;
		case 1 :
			[editor setNestingMode:SPRuleEditorNestingModeSimple];
			[editor addRow:nil];
		break;
		case 2 :
			[editor setNestingMode:SPRuleEditorNestingModeList];
			[editor addRow:nil];
		break;
		case 3 :
			[editor setNestingMode:SPRuleEditorNestingModeSingle];
			[editor addRow:nil];
		break;
	}
}

-(@action)rowHeightChanged:(id)sender
{
	var value=[[sender stringValue] floatValue];
	[editor setRowHeight:value];
	[sender setStringValue:[editor rowHeight]];
}

-(@action)autoRefreshClicked:(id)sender
{
	if([sender state]==CPOffState)
	{
		_autoRefresh=NO;
		[refreshButton setEnabled:YES];
		return;
	}
	
	_autoRefresh=YES;
	[refreshButton setEnabled:NO];
	[self refreshPredicate];
}

-(@action)refreshClicked:(id)sender
{
	[self refreshPredicate];
}

@end
