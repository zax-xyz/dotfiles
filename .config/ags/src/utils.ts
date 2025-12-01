import GLib from "gi://GLib";
import { Accessor } from "gnim";

export const pathToURI = (path: string): string => {
  switch (true) {
    case /^[/]/.test(path):
      return `file://${path}`;

    case /^[~]/.test(path):
    case /^file:\/\/[~]/i.test(path):
      return `file://${GLib.get_home_dir()}/${path.replace(/^(file\:\/\/|[~]|file\:\/\[~])/i, "")}`;
  }

  return path;
};

/**
 * Wraps a value in an Accessor if it isn't already one
 */
export const toAccessor = <T>(val: T | Accessor<T>): Accessor<T> =>
  val instanceof Accessor ? val : new Accessor(() => val);

/**
 * Mimics tailwind default spacing scale
 */
export const spacing = (value: number): number => value * 4;
