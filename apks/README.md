This folder will store the apks created using build_apk.sh script in /scripts folder.

## How to Use?

1. From the root of your project run:

```sh
./scripts/build_apk.sh
```

While running build_apk.sh, if an apk with name <project_name>.apk already exists, then its name will be appended with its last modified date to keep the backup. And then newly generated apk file will be moved to /scripts from its default build path.
