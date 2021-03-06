//
//    The MIT License (MIT)
//
//    Copyright (c) 2013 real-prometheus <real.prometheus@gmail.com>
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy of
//    this software and associated documentation files (the "Software"), to deal in
//    the Software without restriction, including without limitation the rights to
//    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//    the Software, and to permit persons to whom the Software is furnished to do so,
//    subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
#import "Sample2Controller.h"
#import "CDIInjector.h"
#import "MySample2ServiceDummy.h"

@implementation Sample2Controller

// In this case, there are multiple implementations (MySample2ServiceDummy and
// MySample2ServiceImplementation) which would fulfill the MySample2Service.
// Inject the sample service implementation manually, otherwise you will get an runtime exception.
@inject(sampleService,MySample2ServiceDummy);

- (IBAction)doIt:(id)sender {
  // Call the service methods
  NSString *status = [sampleService getStatus];
  NSNumber *count = [sampleService count];
  // Log the output to console and text area
  NSLog(@"Sample service says: Count %@ -> %@", count, status);
  _logArea.text = [_logArea.text stringByAppendingFormat:@"\nCount %@: github.com status is %@", count, status];
}

@end
