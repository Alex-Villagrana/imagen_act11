import 'package:flutter/material.dart';

void main() => runApp(const AppSkateshop());

class AppSkateshop extends StatelessWidget {
  const AppSkateshop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const CheckoutScreen(),
    );
  }
}

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        // 1. NOMBRE DE LA TIENDA EN LUGAR DE ICONO (Ajustado a tu dibujo)
        leadingWidth: 120,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "ZØN",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  height: 1.0,
                ),
              ),
              Text(
                "SKATE\nSHOP",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w900,
                  height: 0.9,
                ),
              ),
            ],
          ),
        ),
        // 2. ICONO DE CARRITO CON EL "0" A LA IZQUIERDA
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                const Text(
                  "0",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.shopping_bag_outlined, color: Colors.black, size: 28),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Resumen de orden
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Order Summary ^", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Text("\$69.75", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            const Divider(height: 30, color: Colors.black12),

            // PRODUCTOS (Usando tu imagen de GitHub)
            _itemCarrito(
              "Shipping Protection", 
              "\$4.15", 
              false, 
              ""
            ),
            _itemCarrito(
              "SANTA CRUZ SKATE", 
              "\$65.50", 
              true, 
              "https://raw.githubusercontent.com/Alex-Villagrana/imagenes_act10/refs/heads/main/skate1.jpg"
            ),
            
            const SizedBox(height: 20),

            // Código de Descuento
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Discount Code",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: const BorderSide(color: Colors.black, width: 2),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black),
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  ),
                  child: const Text("Apply"),
                ),
              ],
            ),
            
            const SizedBox(height: 30),

            // Totales
            _filaTotal("Subtotal • 2 items", "\$69.75"),
            _filaTotal("Shipping", "Enter Shipping Address", isBlue: true),
            const Divider(height: 40),
            _filaTotal("Total", "USD \$69.75", isBold: true),

            const SizedBox(height: 30),

            // Botones de Pago final
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                ),
                child: const Text("SHOP", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(child: _botonMetodoPago("PAYPAL")),
                const SizedBox(width: 10),
                Expanded(child: _botonMetodoPago("Apple Pay")),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // --- WIDGETS AUXILIARES ---

  Widget _itemCarrito(String nombre, String precio, bool esProducto, String urlImagen) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        child: esProducto 
          ? Image.network(urlImagen, fit: BoxFit.contain)
          : const Icon(Icons.shield_outlined, color: Colors.black),
      ),
      title: Text(nombre, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      subtitle: const Text("8.0 / BLACK"), // Detalle como en tu dibujo
      trailing: Text(precio, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _filaTotal(String etiqueta, String valor, {bool isBold = false, bool isBlue = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(etiqueta, style: TextStyle(fontSize: 15, fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(valor, style: TextStyle(
            fontSize: 15, 
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isBlue ? Colors.blue : Colors.black,
            decoration: isBlue ? TextDecoration.underline : null,
          )),
        ],
      ),
    );
  }

  Widget _botonMetodoPago(String texto) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.black),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      child: Text(texto, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }
}