
    NSString* str = @"mystring";
    
    const void* pointerToStr = (__bridge const void*)str;
    int intValueOfPointer = (int)pointerToStr;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true);
    NSString *pathDocuments = [paths objectAtIndex:0];
    NSString *pathForFile = [pathDocuments stringByAppendingPathComponent:@"myfile"];
    
    NSString* strSaveToFile = [NSString stringWithFormat:@"%i", intValueOfPointer];
    NSError* err = nil;
    [strSaveToFile writeToFile:pathForFile atomically:true encoding:NSUTF8StringEncoding error:&err];
    
    NSString* strFromFile = [NSString stringWithContentsOfFile:pathForFile encoding:NSUTF8StringEncoding error:&err];
    
    int intValueOfPointerFromFile = [strFromFile intValue];
    const void* pointerToStrFromFile = (const void*)intValueOfPointerFromFile;
    NSString* strPointerToStr = (__bridge NSString*)pointerToStrFromFile;
    NSLog(@"%i, strPointerToStr=%@", __LINE__, strPointerToStr);

