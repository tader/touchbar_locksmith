# touchbar_locksmith

Adds current Locksmith CLI status and timer to an TouchBar function key.

## Install:

Install the plugin using fisherman:

```
fisher tader/touchbar_locksmith
```

## Configure:

In order to bind to the function keys and event handlers, we need to initialize
`touchbar_locksmith` from your `config.fish`. Initialization is done by calling
the function `touchbar_locksmith` with an function key as argument.

For example, to enable `touchbar_locksmith` on function key 1, add the following
to `~/.config/fish/config.fish`:

```
touchbar_locksmith F1
```
