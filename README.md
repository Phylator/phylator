# Phylator

A simple but powerful calculator for physics.

**https://phylator.com**

### Data

View at, enhance or add to Phylator's data:

* [Quantities](https://github.com/Phylator/data/blob/master/quantities.json)
* [Equations](https://github.com/Phylator/data/blob/master/equations.json)
* [Units](https://github.com/Phylator/data/blob/master/units.json)
* [Constants](https://github.com/Phylator/data/blob/master/constants.json)
* [Categories](https://github.com/Phylator/data/blob/master/categories.json)
* [Packs](https://github.com/Phylator/data/blob/master/packs.json)
* [SI prefixes](https://github.com/Phylator/data/blob/master/si_prefixes.json)

### Development

This project uses [asdf](https://github.com/asdf-vm/asdf) as version manager, [Yarn](https://github.com/yarnpkg/yarn) as JavaScript package manager, and [Bundler](https://github.com/bundler/bundler) for Rubygems.

Dependencies are listed in the [.tool-versions](.tool-versions) file.

1. Clone this repository

    `$ git clone ssh://git@github.com/Phylator/phylator.git`

2. Install dependencies

    ```
    $ asdf install
    $ yarn install
    $ bundle install
    ```

3. Credentials setup

    Customize [credentials.yml.sample](config/credentials.yml.sample)
    `EDITOR=vim be rails credentials:edit`

    Copy [.env.sample](.env.sample) to `.env` and customize

4. Database setup

    `$ rails db:setup`

5. Start development server

    `$ bundle exec foreman start -f Procfile.dev`

### Testing

This project uses a number of packages for testing and linting:

```
$ bundle exec rspec
$ bundle exec rubocop
$ bundle exec haml-lint
$ yarn run stylelint
$ yarn run eslint
```

### Deployment

The `master` branch of this repository is automatically deployed on Heroku.
