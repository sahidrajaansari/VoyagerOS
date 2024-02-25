gpparams=-m32
asparams=--32
ldparams=-melf_i386
objects= kernel.o loader.o

%.o : %.c
	g++ $(gpparams) -o $@ -c $<

%.o : %.s
	as $(asparams) -o $@ $<

mykernel.bin : linker.ld $(objects)
	ld $(objects) -T $< -o $@ $(objects)

install : mykernel.bin
	sudo cp $< /boot/mykernel.bin