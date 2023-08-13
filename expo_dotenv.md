# Expo dotenv configuration

**Deps**: react-native-dotenv

- Add ['module:react-native-dotenv'] to `babel.config.js` under plugins
- Add your env var to .env file, like `MY_VAR=somevalue`
- Add `src/types/env.d.ts` with the following content:
    ```ts
    declare module '@env' {
        export const MY_VAR: string;
    }
    ```
- Add ` "./src/types"` to `tsconfig.json` under `compilerOptions > typeRoots`

Example of usage:
```ts
import { MY_VAR } from '@env';

export const myVar = (): string => {
  return MY_VAR ?? 'defaultvalue';
};

```

For usage with eas build in bitbucket pipeline, add the following step:

```yml
- step:
    name: Building and deploying
      script:
        # Creating .env file
        - echo MY_VAR="${MY_VAR}" > .env
        # Installing dependencies
        - yarn global add eas-cli
        # Adding git support https://github.com/expo/fyi/blob/main/eas-vcs-workflow.md
        - apk add git
        # Building app on eas servers
        - eas build --platform android --profile staging --non-interactive --no-wait
```

And add a .easignore file with all the content of the gitignore file except the .env file.