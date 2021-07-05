## kenv

### Setup oh-my-zsh

#### Install buildkite plugin
```zsh
pushd $ZSH/custom/plugins && \
  git clone git@github.com:johnlayton/baxterstreet.git kenv && \
  popd || echo "I'm broken"
```
```zsh
plugins=(... kenv)
```

### Setup other

```zsh
pushd $HOME && \
  git clone git@github.com:johnlayton/baxterstreet.git .kenv && \
  popd || echo "I'm broken"
```

```zsh
source ~/.kenv/kenv.plugin.zsh
```


### Usage

#### 
```zsh
```

#### 
```zsh
```

#### 
```zsh
```
