import 'package:customer_support/contact_option.dart';
import 'package:customer_support/faqs.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerSupportScreen extends StatelessWidget {
  const CustomerSupportScreen({Key? key, required this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/Kobicypher.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white60,
                          width: 1,
                        ),
                      ),
                      padding: const EdgeInsets.all(16.0),
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "24/7",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          // const Spacer(),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.circle,
                            color: Colors.white,
                            size: 10,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            title.toUpperCase(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.10,
                  left: MediaQuery.of(context).size.width * 0.05,
                  right: MediaQuery.of(context).size.width * 0.05,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const ContactOption(
              text: "Call Us",
              icon: Icons.phone,
              url: '+233-256-325-592',
            ),
            const SizedBox(height: 5),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              thickness: 1.5,
              endIndent: 20,
              indent: 20,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 20),
                const Icon(Icons.email, color: Color(0xFF101820)),
                const SizedBox(width: 10),
                const Text(
                  "Email Us",
                  style: TextStyle(
                    color: Color(0xFF101820),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00539C),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        String? encodeQueryParameters(
                            Map<String, String> params) {
                          return params.entries
                              .map((MapEntry<String, String> e) =>
                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                              .join('&');
                        }

                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'kennediowusu@gmail.com',
                          query: encodeQueryParameters({
                            'subject': title,
                            'body': 'Hello, Customer Support Team,'
                          }),
                        );
                        try {
                          launchUrl(emailLaunchUri);
                        } catch (e) {
                          // print(e);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Email is not available',
                              ),
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              thickness: 1.5,
              endIndent: 20,
              indent: 20,
            ),
            const SizedBox(height: 5),
            const ContactOption(
              text: "Chat with Us",
              icon: Icons.chat,
              url: 'https://wa.me/+233-256-325-592',
            ),
            const SizedBox(height: 5),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              thickness: 1.5,
              endIndent: 20,
              indent: 20,
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 20),
                const Icon(Icons.location_on, color: Color(0xFF101820)),
                const SizedBox(width: 10),
                const Text(
                  "Visit Us",
                  style: TextStyle(
                    color: Color(0xFF101820),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00539C),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        final Uri mapLaunchUri = Uri(
                          scheme: 'https',
                          path: 'goo.gl/maps/3Y5Z9ZQ9Z9Z9Z9Z9Z',
                        );

                        try {
                          launchUrl(mapLaunchUri);
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Map is not available',
                              ),
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              thickness: 1.5,
              endIndent: 20,
              indent: 20,
            ),
            const SizedBox(height: 5),
            // FAQs
            Row(
              children: [
                const SizedBox(width: 20),
                const Icon(
                  Icons.help,
                  color: Color(0xFF101820),
                ),
                const SizedBox(width: 10),
                const Text(
                  "FAQs",
                  style: TextStyle(
                    color: Color(0xFF101820),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00539C),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        // Get.to(() => FAQSView());

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FAQSView()));
                      },
                      icon: const Icon(
                        Icons.help,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 5),
            Divider(
              color: Colors.grey.withOpacity(0.5),
              thickness: 1.5,
              endIndent: 20,
              indent: 20,
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
