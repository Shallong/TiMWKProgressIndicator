/**
 * Your Copyright Here
 *
 * Appcelerator Titanium is Copyright (c) 2009-2010 by Appcelerator, Inc.
 * and licensed under the Apache Public License (version 2)
 */
#import "DeMarcelpociotMwkprogressModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "MWKProgressIndicator.h"

@implementation DeMarcelpociotMwkprogressModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"c169d45b-52bd-4f40-a274-54e19d7a5215";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"de.marcelpociot.mwkprogress";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];
	
	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably
	
	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added 
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs

-(id)show:(id)args
{
    ENSURE_UI_THREAD(show, args);
    [MWKProgressIndicator show];
    if( [args class] == [NSString class] )
    {
        [MWKProgressIndicator updateMessage:[TiUtils stringValue:args]];
    }
}

-(id)showMessageWithColor:(id)args
{
    ENSURE_UI_THREAD_1_ARG(args);
    ENSURE_SINGLE_ARG(args, NSDictionary);
	[MWKProgressIndicator showMessage:[args objectForKey:@"message"] color:[[TiUtils colorValue:[args objectForKey:@"color"]]_color]];
}

-(id)dismiss:(id)args
{
    ENSURE_UI_THREAD(dismiss, args);
    [MWKProgressIndicator dismiss];
}


-(id)updateTrackColor:(id)args
{
    ENSURE_UI_THREAD_1_ARG(args);
    [MWKProgressIndicator setTrackColor:[TiUtils colorValue:args].color];
}

-(id)updateProgress:(id)args
{
    ENSURE_UI_THREAD_1_ARG(args);
    ENSURE_SINGLE_ARG(args,NSNumber);
    [MWKProgressIndicator updateProgress:[args floatValue]];
}

-(id)updateMessage:(id)args
{
    ENSURE_UI_THREAD_1_ARG(args);
    ENSURE_SINGLE_ARG(args,NSString);
    [MWKProgressIndicator updateMessage:[TiUtils stringValue:args]];
}

-(id)showSuccessMessage:(id)args
{
    ENSURE_UI_THREAD_1_ARG(args);
    ENSURE_SINGLE_ARG(args, NSString);
    [MWKProgressIndicator showSuccessMessage:[TiUtils stringValue:args]];
}

-(id)showErrorMessage:(id)args
{
    ENSURE_UI_THREAD_1_ARG(args);
    ENSURE_SINGLE_ARG(args, NSString);
    [MWKProgressIndicator showErrorMessage:[TiUtils stringValue:args]];
}

-(id)showMessageWithColorDuration:(id)args
{
    ENSURE_UI_THREAD_1_ARG(args);
    ENSURE_SINGLE_ARG(args, NSDictionary);
	CGFloat duration = [TiUtils floatValue:[args objectForKey:@"duration"]];
	UIColor *color = [[TiUtils colorValue:[args objectForKey:@"color"]]_color];
	[MWKProgressIndicator showColor:color duration:duration message:[args objectForKey:@"message"]];
}

@end
