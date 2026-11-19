'use client'
import React from 'react'
import { SessionProvider, SessionProviderProps } from "next-auth/react";


export const NextAuthProvider: React.FC<SessionProviderProps> = ({children}: {children: React.ReactNode}) => {
  return (
    <SessionProvider>
    {children}
    </SessionProvider>
  )
}
