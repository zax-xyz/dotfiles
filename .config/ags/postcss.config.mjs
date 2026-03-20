import tailwindcss from "@tailwindcss/postcss";
import { Declaration, Rule } from "postcss";
import postcssPresetEnv from "postcss-preset-env";

const transformRootToWindow = root => {
  root.walkRules(rule => {
    if (rule.selectors.includes(":root")) {
      rule.selector = "window";
    }
  });
};

const removeSupports = root => {
  root.walkAtRules("supports", rule => {
    rule.replaceWith(new Rule({ selector: "window", nodes: rule.nodes }));
  });
};

const defaultDarkTheme = root => {
  root.walkAtRules("media", rule => {
    rule.replaceWith(rule.nodes);
  });
};

const unknownPseudoClasses = ["::file-selector-button", "::backdrop", "::after", "::before"];

const removeUnknownPseudoClasses = root => {
  root.walkRules(rule => {
    const newSelectors = rule.selectors.filter(
      segment => !unknownPseudoClasses.some(c => segment.includes(c)),
    );
    if (newSelectors.length > 0) {
      rule.selectors = newSelectors;
    } else {
      rule.remove();
    }
  });
};

const removeUniversal = root => {
  root.walkRules(rule => {
    if (rule.selector === "*") {
      rule.remove();
    }
  });
};

const atProperties = root => {
  root.walkAtRules("property", rule => {
    const prop = rule.params;
    const { value } = rule.nodes.find(node => node.prop === "initial-value") ?? {};

    if (value !== undefined) {
      rule.replaceWith(new Rule({ selector: "window", nodes: [new Declaration({ prop, value })] }));
    } else {
      rule.remove();
    }
  });
};

export default {
  plugins: [
    tailwindcss,
    transformRootToWindow,
    removeSupports,
    defaultDarkTheme,
    removeUnknownPseudoClasses,
    removeUniversal,
    atProperties,
    postcssPresetEnv,
  ],
};
