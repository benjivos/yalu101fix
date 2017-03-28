#import "substrate.h"
#import "fishhook.h"

static int (*_system)(const char *);

int	system_replaced(const char * args)
{
    if (strcmp("echo 'really jailbroken'; (sleep 1; /bin/launchctl load /Library/LaunchDaemons/dropbear.plist)&", args) == 0){
        return _system("/usr/libexec/substrate; find /Library/LaunchDaemons/ -name '*.plist' ! -name \"0.reload.plist\" -exec launchctl load {} \\;; killall imagent; killall SpringBoard;");
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
