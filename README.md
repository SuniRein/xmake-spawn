# XMake Spawn

A useful [XMake](https://xmake.io) plugin to generate user-customized project files.

## Installation

```bash
 git clone https://github.com/SuniRein/xmake-spawn ${XMAKE_GLOBALDIR:-$HOME}/.xmake/plugins/xmake-spawn
```

## Usage

1. Set `XMAKE_SPAWN_TEMPLATEDIR` environment variable to the directory containing the project templates.

```
export XMAKE_SPAWN_TEMPLATEDIR=/path/to/templates
```

2. Create a custom project template in the directory specified by `XMAKE_SPAWN_TEMPLATEDIR`.

3. List available templates.

```bash
xmake spawn --list
```

4. Run `xmake spawn` to generate the project files.

```bash
# Generate a project named `name` using the template `example`
# A git repository will be initialized in the project directory
xmake spawn --template=example name
# OR
xmake spawn -t example name
```

## License

This project is licensed under the [GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html).
See the LICENSE file for details.
