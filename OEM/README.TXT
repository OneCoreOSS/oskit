========= OEM Customization Guide =========

In the OSKIT root folder, you should have an "OEM" folder.

If you don't see it then you should try updating your OSKit
version to the latest.

Inside of the "OEM" folder you will see 2 folders :

	/OEM/ISO

	/OEM/RFS

The "ISO" folder represents the ISO Customization, anything
you put inside of the "ISO" folder will end up inside of

	@ISO:/OEM

This is useful for introducing LICENSES or SETUP UTILITIES
directly inside of the installation media without having
to bloat the ROOTFS (Increasing the MEMORY REQUIREMENT)

You will also be able to create a file "/OEM/ISO/OEMBoot.sh" which
will asynchronously boot whenever you pass KERNEL OPTION :

	"oemboot"

NOTE: "oemboot" is already included in the default ISO since 25H2.

This is useful for loading services or packages in the background.
The script will also run in the "OEM DEBUG CONSOLE" (formerly known
as the "OPERATOR CONSOLE" or "OPCON")

By default, the OEM DEBUG CONSOLE will use SERIAL (ttyS0) for its
output. You can change that by appending KERNEL OPTION :

	"oemcon=<device name>"



The "RFS" folder represents the ROOTFS Customization, anything
you put inside of the "RFS" folder will end up inside of

	@ROOTFS:/etc/OneCore/OEM

This is mostly intended for testing purposes or devices
that comes with U-BOOT and cannot access the INSTALL/BOOT MEDIA

This also includes devices that uses NET BOOTING, although
it is highly recommended to NOT use the RFS customization for
any SETUP UTILITIES. Instead you should use a CLOUD SETUP.
