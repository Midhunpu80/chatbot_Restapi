import 'package:chat_bot/view/home.dart';
import 'package:flutter/material.dart';

botmesseges(Messege mess) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: SizedBox(
      height: mess.is_bool ? 100 : 280,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(52),
                    color: mess.is_bool
                        ? const Color.fromARGB(255, 255, 2, 183)
                        : const Color.fromARGB(255, 47, 0, 255)),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    mess.is_bool ? "user" : "bot",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                )),
          ),
          mess.is_bool
              ? Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(
                      height: 500,
                      width: 280,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 255, 2, 183)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          mess.usertext,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Container(
                      height: 500,
                      width: 280,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 0, 0, 255)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          mess.usertext,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                )
        ],
      ),
    ),
  );
}
