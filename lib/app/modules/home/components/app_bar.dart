import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String greeting;
  final String userName;

  const CustomAppBar({
    super.key,
    required this.greeting,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        color: Color.fromARGB(0, 255, 255, 255),
      ),
      child: Stack(
        children: [
          Transform.translate(
            offset: const Offset(0, 50),
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/map-global.png'),
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            greeting,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            userName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        _buildIconButton(Icons.notifications),
                        const SizedBox(width: 5),
                        _buildIconButton(Icons.info),
                        const SizedBox(width: 5),
                        _buildHelpButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton(IconData icon) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        color: const Color.fromARGB(63, 255, 255, 255),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Center(
        child: Icon(icon, color: Colors.white),
      ),
    );
  }

  Widget _buildHelpButton() {
    return Container(
      height: 35,
      width: 90,
      decoration: BoxDecoration(
        color: const Color.fromARGB(63, 255, 255, 255),
        borderRadius: BorderRadius.circular(35),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.headset_mic, color: Colors.white),
          SizedBox(width: 3),
          Text(
            'Bantuan',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
