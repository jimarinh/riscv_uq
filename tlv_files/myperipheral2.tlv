\m4_TLV_version 1d: tl-x.org
\TLV myperipheral()   
   /view
      \viz_js
         box: {width: 360, height: 183, strokeWidth: 0},
         init() {
            let peripheralname = new fabric.Text("Peripherals", {
              left: -150 + 150,
              top: -150 + 40,
              textAlign: "center",
              fontSize: 22,
              fontWeight: 600,
              fontFamily: "Timmana",
              fontStyle: "italic",
              fill: "#ffffff",
            })
            let periphbox = new fabric.Rect({
              left: -150,
              top: -130,
              fill: "#665d60",
              width: 360,
              height: 183,
              strokeWidth: 10,
              stroke: "#a0a0a0",
            })
            let val1box = new fabric.Rect({
              left: -150 + 82,
              top: -150 + 83,
              fill: "#d0d8e0",
              width: 214,
              height: 40,
              strokeWidth: 5,
              stroke: "#608080",
            })
            let val1num = new fabric.Text("--------", {
              left: -150 + 185,
              top: -150 + 83 + 8,
              textAlign: "right",
              fill: "#505050",
              fontSize: 22,
              fontFamily: "Courier New",
            })
            let b7 = new fabric.Rect({
              left: -150 + 28,
              top: -150 + 148,
              fill: "#a0a0a0",
              width: 32,
              height: 32,
              strokeWidth: 1,
              stroke: "#b0b0b0",
            })
            let b6 = new fabric.Rect({
              left: -150 + 68,
              top: -150 + 148,
              fill: "#a0a0a0",
              width: 32,
              height: 32,
              strokeWidth: 1,
              stroke: "#b0b0b0",
            })
            let b5 = new fabric.Rect({
              left: -150 + 108,
              top: -150 + 148,
              fill: "#a0a0a0",
              width: 32,
              height: 32,
              strokeWidth: 1,
              stroke: "#b0b0b0",
            })
            let b4 = new fabric.Rect({
              left: -150 + 148,
              top: -150 + 148,
              fill: "#a0a0a0",
              width: 32,
              height: 32,
              strokeWidth: 1,
              stroke: "#b0b0b0",
            })
            let b3 = new fabric.Rect({
              left: -150 + 188,
              top: -150 + 148,
              fill: "#a0a0a0",
              width: 32,
              height: 32,
              strokeWidth: 1,
              stroke: "#b0b0b0",
            })
            let b2 = new fabric.Rect({
              left: -150 + 228,
              top: -150 + 148,
              fill: "#a0a0a0",
              width: 32,
              height: 32,
              strokeWidth: 1,
              stroke: "#b0b0b0",
            })
            let b1 = new fabric.Rect({
              left: -150 + 268,
              top: -150 + 148,
              fill: "#a0a0a0",
              width: 32,
              height: 32,
              strokeWidth: 1,
              stroke: "#b0b0b0",
            })
            let b0 = new fabric.Rect({
              left: -150 + 308,
              top: -150 + 148,
              fill: "#a0a0a0",
              width: 32,
              height: 32,
              strokeWidth: 1,
              stroke: "#b0b0b0",
            })
            return {periphbox, peripheralname, val1box, val1num, b7, b6, b5, b4, b3, b2, b1, b0}
         },
         render() {
            let missing_ports = false;
            let sig_names = ["outport0", "outport1"];
            getSig = (name) => {
               let sig = this.svSigRef(`L0_${name}_a0`);
               if (sig == null || !sig.exists()) {
                  missing_ports=true;
                  sig = this.svSigRef(`sticky_zero`);
               }
               return sig;
            }
            var sigs = sig_names.reduce(function(result, sig_name, index) {
               result[sig_name] = getSig(sig_name)
               return result
            }, {})
            this.getObjects().val1num.set({text: sigs.outport0.asInt(NaN).toString(16).padStart(8, " ")})
            let p1 = sigs.outport1.asInt(NaN)
            this.getObjects().b0.set({fill: (p1&1)!=0 ?  "#c0d0e0" : "#a0a0a0"})
            this.getObjects().b1.set({fill: (p1&2)!=0 ?  "#c0d0e0" : "#a0a0a0"})
            this.getObjects().b2.set({fill: (p1&4)!=0 ? "#c0d0e0" : "#a0a0a0"})
            this.getObjects().b3.set({fill: (p1&8)!=0 ? "#c0d0e0" : "#a0a0a0"})
            this.getObjects().b4.set({fill: (p1&16)!=0 ?  "#c0d0e0" : "#a0a0a0"})
            this.getObjects().b5.set({fill: (p1&32)!=0 ?  "#c0d0e0" : "#a0a0a0"})
            this.getObjects().b6.set({fill: (p1&64)!=0 ? "#c0d0e0" : "#a0a0a0"})
            this.getObjects().b7.set({fill: (p1&128)!=0 ? "#c0d0e0" : "#a0a0a0"})
            if (missing_ports) {
               this.getObjects().periphbox.set({fill: "red"})
            }
         },
         where: {left: 780, top: 50}
		 
\SV
   m4_makerchip_module  // (Expanded in Nav-TLV pane.)
\TLV
   // Do nothing.
\SV
   endmodule