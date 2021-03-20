# Youtube CC Package 

### Description
Dart package with closed captions for Youtube videos

### Features

 - Get videos all closed captions by language
 - Get videos closed captions by second and language

### Example	
By language

    void  main(List<String> args) async {
    
    ClosedCaptionsService service =  ClosedCaptionsService();
    List<ClosedCaptionModel> model =  await service.getAllClosedCaptions(
    videoID:  "dwxT2uWOKtE", language:  "en");
    
    model.forEach((element) {
    print("Text: "  +
    element.text +
    " Start: "  +
    element.start +
    " Dur: "  +
    element.duration);
    });
    
    runApp(MyApp());
    }

By second and language
	
    void  main(List<String> args) async {
   
    ClosedCaptionsService service =  ClosedCaptionsService();
    ClosedCaptionModel model =  await service.getClosedCaptionByTime(
    videoID:  "CevxZvSJLk8", language:  "en", second:  30);
    
      
    
    print("Text: "  +
    model.text +
    " Start: "  +
    model.start +
    " Dur: "  +
    model.duration);
  
    runApp(MyApp());
    }

## MIT LICENSE

    MIT License
    
    Copyright (c) 2021 Berat Kurt
    
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
