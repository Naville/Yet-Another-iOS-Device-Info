//
//  DeviceID.m
//  DeviceID
//
//  Created by Zhang Naville on 15/9/17.
//  Copyright © 2015年 Naville. All rights reserved.
//

#import "DeviceID.h"
#import <dlfcn.h>
#import "FclBlowfish.h"
//#define PRIVATE_PATH  "/System/Library/PrivateFrameworks/IOKit.framework/IOKit"
@implementation DeviceID
+(id)getIDInternal:(NSString*)Input{
    NSString* PRIVATEPATH=[DeviceID CKBAJEKWBRHJWKER:@"BMKhwroUw4vCuU44w5bCq0XCjAQwVnVHTcOpw7s0ZMOkTC44wqDDq8KOwpcsV3Avw5fCtThaZsK6Mz99QB5xEsKtw7PDr8OiwqYJc8KsAw=="];
    NSString *serialNumber = nil;
    void *IOKit = dlopen([PRIVATEPATH UTF8String],RTLD_NOW);
    if (IOKit)
    {
        mach_port_t *kIOMasterPortDefault = dlsym(IOKit, [[DeviceID CKBAJEKWBRHJWKER:@"wpZxwrJhBcK6YMOzwo3Dk8KzwrNUWMOSwozDkMOZZsKkNcKyw5Z/"] UTF8String]);
        CFMutableDictionaryRef (*IOServiceMatching)(const char *name) = dlsym(IOKit, [[DeviceID CKBAJEKWBRHJWKER:@"DMKhQF7Do0PDncOdPV3CqcO+w57DrcOuXMKVBMK8QBwNGyk="] UTF8String]);
        mach_port_t (*IOServiceGetMatchingService)(mach_port_t masterPort, CFDictionaryRef matching) = dlsym(IOKit,[[DeviceID CKBAJEKWBRHJWKER:@"DMKhQF7Do0PDncOdw5/CtMK4w5Fbw5tpwrDCmcO4LMKzasOCAHzDvg0hbcK9w58DXQ=="] UTF8String]);
        CFTypeRef (*IORegistryEntryCreateCFProperty)(mach_port_t entry, CFStringRef key, CFAllocatorRef allocator, uint32_t options) = dlsym(IOKit, [[DeviceID CKBAJEKWBRHJWKER:@"W3rCrcOJw7Q+DsKsw5PDnxPDkMKxwoTDnw42wo7DtcOJwp7DnGDCihrCk0LDgkvDpnlK"] UTF8String]);
        kern_return_t (*IOObjectRelease)(mach_port_t object) = dlsym(IOKit,[[DeviceID CKBAJEKWBRHJWKER:@"wrDCk8OjFsKlwobCksOaShhYecK9LMOEZA=="] UTF8String]);
        
        if (kIOMasterPortDefault && IOServiceGetMatchingService && IORegistryEntryCreateCFProperty && IOObjectRelease)
        {
            mach_port_t platformExpertDevice = IOServiceGetMatchingService(*kIOMasterPortDefault, IOServiceMatching([[DeviceID CKBAJEKWBRHJWKER:@"H8KZVT7CgC/Dni1iC8O/MsOFwqXCt8Ktw7ptRMO1YMOuwpPDtQ=="] UTF8String]));
            if (platformExpertDevice)
            {
                CFStringRef TMP=(__bridge CFStringRef)[DeviceID CKBAJEKWBRHJWKER:Input];
                CFTypeRef platformSerialNumber = IORegistryEntryCreateCFProperty(platformExpertDevice,TMP, kCFAllocatorDefault, 0);
                if(platformSerialNumber==NULL){
                    
                    return nil;
                }
                if (CFGetTypeID(platformSerialNumber) == CFStringGetTypeID())
                {
                    
                    serialNumber = [NSString stringWithString:(__bridge NSString*)platformSerialNumber];
                    
                    CFRelease(platformSerialNumber);
                }
                else if(CFGetTypeID(platformSerialNumber) == CFNumberGetTypeID()){
                    NSString* Number=[NSString stringWithFormat:@"%@",(__bridge NSNumber*)platformSerialNumber];
                    
                    serialNumber = [NSString stringWithString:Number];
                    
                    CFRelease(platformSerialNumber);
                    
                }
                else if(CFGetTypeID(platformSerialNumber) == CFDataGetTypeID()){
                    NSString* Number=[[NSString alloc] initWithData:(__bridge NSData*)platformSerialNumber encoding:NSUTF8StringEncoding];
                    
                    serialNumber = [NSString stringWithString:Number];
                    
                    CFRelease(platformSerialNumber);
                    
                }
                IOObjectRelease(platformExpertDevice);
            }
        }
        dlclose(IOKit);
    }

    return serialNumber;
    
}
+(NSString*)CKBAJEKWBRHJWKER:(NSString*)iNPUT{
    FclBlowfish *bf = [[FclBlowfish alloc] init];
    bf.Key = @"7403850378192856";
    bf.IV = @"herjhjrghbjk";
    [bf prepare];
    NSData* ENCData=[[NSData alloc] initWithBase64EncodedString:iNPUT options:0];
    NSString* PRIVATEPATH=[bf decrypt:[[NSString alloc] initWithData:ENCData encoding:NSUTF8StringEncoding] withMode:modeCBC withPadding:paddingZero];

    return PRIVATEPATH;
}
+(id)getID{
    return [DeviceID getIDInternal:@"H8KZVT7CgC/Dni3DpsOmwrbChsOsw5LDmMKl"];
    //No idea about what info are availble on different iOS Versions.Figure that out by yourself.The general idea should work
}
+(id)get2ID{
    
    return [DeviceID getIDInternal:@"H8KZVT7CgC/Dni3CkAHDmyg5ZgTCugExwrjCoSUAwpfCqw=="];
}
+(id)getID3{
   return [DeviceID getIDInternal:@"w4jCjcKkEDLCs8OuwpnCl8K9w53Cpkpdw5crw4PDisOFw4sqw6xhTg=="]; 
}
+(id)getID4{
    
    
    
}
@end
