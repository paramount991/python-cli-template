import sys
from collections.abc import Callable
from functools import wraps


def support_help_at_end[**P, T](func: Callable[P, T]) -> Callable[P, T]:
    """支持 command subcommand help 语法."""

    @wraps(func)
    def wrapper(*args: P.args, **kwargs: P.kwargs) -> T:
        if sys.argv[-1] == 'help':  # 只检查最后一个参数
            sys.argv[-1] = '--help'
        return func(*args, **kwargs)

    return wrapper
