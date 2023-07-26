# Setup
echo "module.exports = () => {};" > fn.js
echo 'module.exports = () => {
  let x  =
      0;
  for (const i of [1, 2, 3]) {
    alert(  `formatting inconsistency ${i}`  );
  }
}' > fn-not-empty.js

echo "================"
echo " SOURCE FILES"
echo "================"

echo "\n./fn.js:"
cat fn.js

echo "\n./fn-not-empty.js:"
cat fn-not-empty.js

echo "\n================"
echo " BUN REPL"
echo "================"

echo "\nlocal empty function"
bunx bun-repl -e 'const fn = () => {}; console.log(`${fn}`);'
# ()=>{}

echo "\nimport empty function"
bunx bun-repl -e 'const fn = require("./fn"); console.log(`${fn}`);'
# () => {
#   }

echo "\nlocal non-empty function"
bunx bun-repl -e 'const fn = () => { let x = 0; }; console.log(`${fn}`);'
# ()=>{
#     let x = 0;
# }

echo "\nimport non-empty function"
bunx bun-repl -e 'const fn = require("./fn-not-empty"); console.log(`${fn}`);'
# () => {
#       let x = 0;
#       for (const i of [1, 2, 3])
#         alert(`formatting inconsistency ${i}`);
#     }

echo "\n================="
echo " NODE REPL"
echo "================="

echo "\nimport empty function"
node -e 'const fn = require("./fn"); console.log(`${fn}`);'
# () => {}

echo "\nlocal empty function"
node -e 'const fn = () => {}; console.log(`${fn}`);'
# () => {}

echo "\nimport non-empty function"
node -e 'const fn = require("./fn-not-empty"); console.log(`${fn}`);'
# () => {
#     let x  =
#         0;
#     for (const i of [1, 2, 3]) {
#       alert(  `formatting inconsistency ${i}`  );
#     }
#   }

echo "\nlocal non-empty function"
node -e 'const fn = () => { let  x  =  0 ; }; console.log(`${fn}`);'
# () => { let  x  =  0 ; }
