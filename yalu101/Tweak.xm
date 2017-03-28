#import "substrate.h"
#import "fishhook.h"

static int (*_system)(const char *);

int system_replaced(const char * args)
{
    if (strcmp("echo 'really jailbroken'; (sleep 1; /bin/launchctl load /Library/LaunchDaemons/dropbear.plist)&", args) == 0){
        NSString *scriptName = [[NSBundle mainBundle] pathForResource: @"fix" ofType: @"sh"];
        NSString *command = [NSString stringWithFormat:@"/bin/sh %@", scriptName];
        return _system([command UTF8String]);
    }
    return _system(args);
}

%ctor {
    static struct rebinding rebindings = {
        "system",
        (void *)system_replaced,
        (void **)&_system
    };
    
    rebind_symbols(&rebindings, 1);
}
