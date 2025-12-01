import clsx from "clsx";

export const MenuButton = ({ class: className, ...props }: JSX.IntrinsicElements["menubutton"]) => {
  return <menubutton class={clsx("*:bg-transparent", className)} {...props} />;
};
