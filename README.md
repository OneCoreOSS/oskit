
# OneCore OSKit

> [!NOTE] 
> OSKit is not a universal environment. This version of OSKit has been specifically designed for the following operating system:
> **OneCore Linux 2025**

OneCore OSKit is a powerful developer environment designed for building and customizing OneCore Linux 2025 images.

OSKit allows you to generate and modify OneCore Linux images on the fly, providing capabilities like post-build scripts, extra ISO content inclusion, and easy TCZ package management.

OSKit simplifies the process of creating customized Linux distributions for all kind of use cases.

## Features

- **OS Rebase**: Rebase the OS using the latest supported TinyCore ISO.
- **SKU Creation**: Create new editions for different releases.
- **Build ISOs**: Build editions as ISO images for easy installation and distribution.
- **Postbuild Scripts**: Automate postbuild tasks such as custom configurations and software installations.
- **Extra ISO Content**: Easily add extra files, packages, or configurations to your ISO image.
- **TCZ Package Management**: Easily manage TinyCore packages (TCZ) during the build process with ``tceflight``

## Requirements

Before using OneCore OSKit, ensure you have the following:

- A Linux environment from any modern distros
- The BASH shell or BASH-syntax shells.
- Dependencies: `bash`, `curl`, and other standard Linux tools.

## Installation

1. **Clone the OSKit Repository**

   To get started, clone the OSKit repository:

 ```bash
 $ git clone https://github.com/OneCoreOSS/OSKit
 $ cd OSKit
```

2. **Initialize the environment**

   In order to use the OSKit, you will **always** need to initialize the environment beforehand:

 ```bash
 $ source SETENV.SH
 <OSKit welcome message>
```

3. **Rebase the OSKit with latest TinyCore Linux version**

   Once the OSKit addons are were loaded from step **2**, rebase the OSKit :

```bash
 $ osrebase latest
```
This will apply the OneCore Linux files onto the ``mainline`` edition (which is based from the latest TinyCore version).

4. **Build the image**

   At this point, the OSKit has already given us a basic environment, we now have the ``mainline`` edition which is ready to be built :

```bash
 $ build -media:cdrom -skus:mainline
 <build process>
```

Once complete, you will have a fully working ``.ISO`` in the ``OUTPUT`` folder.

---

OneCore Linux is a distribution based off of TinyCore Linux. All OS packages provided inside of OneCore Linux are sourced from their original sources, located [here](http://tinycorelinux.net/).

The closed source binaries are not included by default inside of the OSKit. The Linux Kernel used inside of the OSKit was compiled using the [Linux ZEN Kernel (6.10.9-zen1)](https://github.com/zen-kernel/zen-kernel/releases/tag/v6.10.9-zen1) unmodified source code.

OneCore Linux is licensed under the [Apache 2.0 License](https://www.apache.org/licenses/LICENSE-2.0.html).
