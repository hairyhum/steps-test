## Testing custom steps for kargo

This repo demonstrates using custom steps for kyverno validation

### Testing kyverno validation

`policies` and `resources` in this repo can be used to run simple kyverno validation.

`policies/prod/block-large-images.yaml` policy requires images to be no bigger than `4Mi`

`resources/pod.yaml` defines a pod with commented out `big` image reference and current `small` image reference.

You can run `kyverno apply policies/prod --resources resources --registry --detailed-results --table` with `big` and `small` image tags to check validation.

### Hello-world custom step

In `stage-hello.yaml` there is a custom step definition and example stage definition to use it.
It will output in `world` whatever passed in the `config.world`

### Kyverno custom step

Custom step requires a custom image with a shell and a script to parse inputs/provide outputs.

Custom image definition is in `image-wrapper` directory and was published as `ghcr.io/hairyhum/steps-test:kyverno`

### Using custom step

Example custom step definition is in `custom-step-kyverno.yaml`

Example stage using the step is in `stage-kyverno.yaml`. This stage is using warehouse from `warehouse.yaml`.

**OPTIONAL** it is possible to use private images after setting up credential and using configs with `secret('')` (see commented out lines in `stage-kyverno.yaml`)




