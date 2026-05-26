import sys
from collections.abc import Callable
from functools import wraps


def support_help_at_end[**P, T](func: Callable[P, T]) -> Callable[P, T]:
    """支持 command subcommand help 语法 (将最右边的 help 转为 --help).

    注意: 直接修改 sys.argv 是为了让 Typer 的 eager option 处理能识别。
    Typer 在 callback 执行前已完成参数解析, 因此修改不会影响其他回调。
    """

    @wraps(func)
    def wrapper(*args: P.args, **kwargs: P.kwargs) -> T:
        # 从右向左找第一个 "help", 替换为 "--help"
        for i in range(len(sys.argv) - 1, 0, -1):
            if sys.argv[i] == 'help':
                sys.argv[i] = '--help'
                break
        return func(*args, **kwargs)

    return wrapper
